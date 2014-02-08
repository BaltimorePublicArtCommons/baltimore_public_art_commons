class Item < ActiveRecord::Base
  has_many :images
  has_many :artists
  has_one :dimension
end
