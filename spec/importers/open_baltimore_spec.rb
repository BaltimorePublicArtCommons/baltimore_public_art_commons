require 'spec_helper'

require_relative '../../lib/importers/open_baltimore'

describe Importers::OpenBaltimore do
  describe '.maybe_import_location' do
    it 'does not create a location where there is none' do
      expect {
        Importers::OpenBaltimore.maybe_import_location(double('Item'), {})
      }.to_not change { Location.count }
    end
    it 'creates a location that does not already exist' do
      item = Item.create
      expect {
        Importers::OpenBaltimore.maybe_import_location(item,
                                                       { 'location' => {
                                                           'longitude' => 15,
                                                           'latitude' => -47
                                                         }
                                                       }
                                                      )
      }.to change { Location.count }.by(1)
      expect(item.locations.count).to eq(1)
    end
  end
  describe '.maybe_import_artist' do
    it 'does not create an artist where there is none' do
      expect {
        Importers::OpenBaltimore.maybe_import_artist(double('Item'), {})
      }.to_not change { Artist.count }
    end
    it 'creates one that does not already exist' do
      expect(Artist.count).to be_zero
      expect {
        Importers::OpenBaltimore.maybe_import_artist(
          double('Item', artists: []),
          { 'artistfirstname' => 'Pablo',
            'artistlastname' => 'Picasso' }
        )
      }.to change { Artist.count }.by(1)
      expect(Artist.first.first_name).to eq('Pablo')
      expect(Artist.first.last_name).to eq('Picasso')
    end
    it 'does not create one that already exists' do
      Artist.create!(first_name: 'Pablo', last_name: 'Picasso')
      expect {
        Importers::OpenBaltimore.maybe_import_artist(
          double('Item', artists: []),
          { 'artistfirstname' => 'Pablo',
            'artistlastname' => 'Picasso' }
        )
      }.to_not change { Artist.count }
    end
  end
  describe '.maybe_import_image' do
    it 'does nothing if there is no image' do
      expect(Importers::OpenBaltimore.maybe_import_image(double('Item'), {})).to be_nil
    end
  end
end
