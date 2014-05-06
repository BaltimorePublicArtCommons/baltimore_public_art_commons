require 'spec_helper'

describe Importers::Csv do
  context '.import' do
    context 'for a simple CSV file' do
      before do
        Importers::Csv.import(
          'spec/fixtures/simple_sample_data.csv',
          'app/assets/images'
        )
      end

      it 'should create all items defined in the CSV file' do
        Item.where(name: ['Baltimore Uproar', 'Colossus I']).count.should == 2
      end

      context 'imported items' do
        let(:item_one) { Item.find_by_name('Baltimore Uproar') }
        let(:item_two) { Item.find_by_name('Colossus I') }

        it 'should have all associated artists' do
          item_one.artists.
            where(first_name: 'Romare', last_name: 'Beardan').
            should be_any
        end

        it 'should have all associated locations' do
          item_one.locations.
            where(street_address: 'Upton Metro Station, Pennsylvania Ave').
            should be_any

          item_two.locations.
            where(street_address:
              'Waxter Center for Senior Citizens, 861 Park Avenue').
            should be_any
        end

        it 'should have all associated organizational donors' do
          item_two.organizational_donors.
            where(name: 'Baltimore City Percent for Art Program').
            should be_any
        end

        it 'should have all associated individual donors' do
          item_one.individual_donors.
            where(first_name: 'Fake', last_name: 'Donor').
            should be_any
        end

        it 'should have all associated fabrications' do
          item_one.fabrication.fabricator.should == 'Fake Fabricator'
          item_two.fabrication.fabricator.should == 'Another Fake Fabricator'
        end

        it 'should have all associated images' do
          item_one.images.pluck(:file).should == ['stock_item_one.jpg']
          item_two.images.pluck(:file).should == ['stock_item_two.jpg']
        end

        it 'should have all assocated image versions' do
          item_one.images.first.small.read_attribute(:file).should ==
            'stock_item_one_small.jpg'
          item_two.images.first.small.read_attribute(:file).should ==
            'stock_item_two_small.jpg'
        end
      end
    end

    context 'when an item has multiple rows for an association' do
      before do
        Importers::Csv.import('spec/fixtures/multiple_artists_sample_data.csv')
      end

      it 'should create an association for each row with the item' do
        item = Item.find_by_name("My Sister's Garden")
        item.artists.count.should == 3
      end
    end

    context 'when an association appears in multiple rows' do
      context 'and the association can be uniquely identified' do
        before do
          Importers::Csv.
            import('spec/fixtures/repeating_artists_sample_data.csv')
        end

        it 'should not create duplicate models for the association' do
          Artist.where(first_name: 'Paul', last_name: 'Daniel').
            count.should == 1
        end

        it 'should create an association for each row with the item' do
          item_one = Item.find_by_name('Double Gamut')
          item_two = Item.find_by_name('Kiko-Cy')

          [item_one, item_two].each do |item|
            item.artists.
              where(first_name: 'Paul', last_name: 'Daniel').
              count.should == 1
          end
        end
      end
    end

    context 'when a row has empty assocations' do
      before do
        Importers::Csv.import('spec/fixtures/empty_association_sample_data.csv')
      end

      it 'should not create empty associations' do
        item = Item.find_by_name('Baltimore Uproar')
        item.organizational_donors.should_not be_any
      end
    end
  end
end
