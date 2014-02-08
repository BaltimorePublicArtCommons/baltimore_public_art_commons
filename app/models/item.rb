class Item < ActiveRecord::Base
  has_many :images
  has_many :artists
end
