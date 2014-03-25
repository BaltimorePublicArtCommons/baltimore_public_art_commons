class ItemArtist < ActiveRecord::Base
  belongs_to :item
  belongs_to :artist
end
