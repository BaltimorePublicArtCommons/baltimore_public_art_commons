require 'spec_helper'

describe Image do
  let(:image) { Image.create! }

  context '#small' do
    context 'when the small image version exists' do
      before do
        image.image_versions.create!(
          file: File.open('app/assets/images/stock_item_one_small.jpg'),
          version: 'small'
        )
      end

      it 'should return the small image version' do
        image.small.file.url.should =~ /.*stock_item_one_small.jpg/
      end
    end

    context 'when the small image version does not exist' do
      it 'should return a newly created small image version' do
        image.small.file.url.should =~ /.*not_available.jpg/
      end
    end
  end

  context '#destroy' do
    context 'when the image has image versions' do
      before do
        image.image_versions.create!(
          file: File.open('app/assets/images/stock_item_one_small.jpg'),
          version: 'small'
        )

        image.destroy!
      end

      it 'should destroy all image versions' do
        image.image_versions.should_not be_any
      end
    end
  end
end
