class Item < ActiveRecord::Base
  include PgSearch

  has_many :item_artists
  has_many :artists, through: :item_artists

  has_many :item_individual_donors
  has_many :individual_donors, through: :item_individual_donors

  has_many :item_organizational_donors
  has_many :organizational_donors, through: :item_organizational_donors

  has_many :images
  has_many :locations

  has_one :dimension
  has_one :fabrication

  multisearchable against: [:name, :material, :description]
end
