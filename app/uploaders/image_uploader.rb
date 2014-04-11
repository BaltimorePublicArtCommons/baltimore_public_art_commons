# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    'not_available.jpg'
  end

  def store_dir
    if Rails.env.test? || Rails.env.cucumber?
      "spec/#{basic_store_dir}"
    else
      basic_store_dir
    end
  end

  version :small do
    process :resize_to_fill => [260,260]
  end
  
  private

  def basic_store_dir
    if model.class == Image
      "uploads/images/#{model.id}"
    else
      "uploads/images/#{model.image_id}"
    end
  end
end
