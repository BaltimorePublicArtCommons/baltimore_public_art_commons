require 'spec_helper'

describe PartialDateLoader do
  context '.load' do
    context 'when the model has a value for the date attribute' do
      let(:item) { Item.create! installation_start_date: 20140100 }

      it 'should return a ParitalDate instance for the date value' do
        parital_date = PartialDateLoader.load(item, :installation_start_date)
        parital_date.should == PartialDate::Date.load(20140100)
      end
    end

    context 'when the model has a value for the date attribute' do
      let(:item) { Item.create! }

      it 'should return an empty ParitalDate instance' do
        parital_date = PartialDateLoader.load(item, :installation_start_date)
        parital_date.should == PartialDate::Date.load(0)
      end
    end
  end
end
