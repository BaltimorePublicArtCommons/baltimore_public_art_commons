class Item < ActiveRecord::Base
  has_many :artists
  has_many :images
  has_many :individual_donors

  has_one :dimension
  has_one :fabrication
end
