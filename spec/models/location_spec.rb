require 'spec_helper'

describe Location do
  context '#current' do
    let(:item) { Item.create! }

    before { item.locations.create! current: true }

    it 'should be true for one location per item' do
      invalid_location = item.locations.create(current: true)
      invalid_location.should have(1).errors_on(:current)
    end
  end
end
