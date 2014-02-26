class Artist < ActiveRecord::Base
  has_many :artists_items
  has_many :items, through: :artists_items
end
