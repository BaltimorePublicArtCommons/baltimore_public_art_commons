class Image < ActiveRecord::Base
  before_destroy :destroy_image_versions

  has_many :image_versions

  mount_uploader :file, ImageUploader

  def small
    image_versions.find_or_create_by(version: 'small')
  end

  private

  def destroy_image_versions
    image_versions.destroy_all
  end
end
