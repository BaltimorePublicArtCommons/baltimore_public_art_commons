class ImageVersion < ActiveRecord::Base
  belongs_to :image

  mount_uploader :file, ImageUploader

  validates :version, inclusion: ['small']
end
