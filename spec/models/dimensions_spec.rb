require 'spec_helper'

describe Dimensions do
  context '#to_s' do
    context 'when the dimensions are empty' do
      let(:dimensions) { Dimensions.new }

      it 'should return an empty string' do
        dimensions.to_s.should == ''
      end
    end

    context 'when dimensions have values for all measurments' do
      let(:dimensions) { Dimensions.new(height: 27.375, width: 12, depth: 4.5) }

      it 'should return the height, width, and depth in feet and inches' do
        dimensions.to_s.should == "H: 2ft 3.375in W: 1ft D: 4.5in"
      end
    end

    context 'when dimensions have values for some measurments' do
      let(:dimensions) { Dimensions.new(height: 27.375, depth: 4.5) }

      it 'should return the available height, width, and depth in feet and inches' do
        dimensions.to_s.should == "H: 2ft 3.375in D: 4.5in"
      end
    end
  end
end
