class ArtistsItem < ActiveRecord::Base
  belongs_to :artist
  belongs_to :item
end
