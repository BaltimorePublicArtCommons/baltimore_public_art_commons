require 'open-uri'

class Item < ActiveRecord::Base
  has_many :artists_items
  has_many :artists, through: :artists_items
  has_many :individual_donors
  has_many :locations
  has_many :organizational_donors

  has_one :dimension
  has_one :fabrication

  has_attached_file :image, styles: { thumb: '100x100>' }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
