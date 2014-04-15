require 'spec_helper'

describe Dimensions do
  let(:dimensions) { Dimensions.new }

  context '#to_s' do
    context 'when the dimensions are empty' do
      it 'should return an empty string' do
        dimensions.to_s.should == ''
      end
    end

    context 'when dimensions have values for all measurments' do
      before do
        dimensions.height = 27.375
        dimensions.width = 12
        dimensions.depth = 4.5
      end

      it 'should return the height, width, and depth in feet and inches' do
        dimensions.to_s.should == "2' 3.375\" x 1' x 4.5\""
      end
    end

    context 'when dimensions have values for some measurments' do
      before do
        dimensions.height = 27.375
        dimensions.depth = 4.5
      end

      it 'should return the available height, width, and depth in feet and inches' do
        dimensions.to_s.should == "2' 3.375\" x 4.5\""
      end
    end
  end
end
