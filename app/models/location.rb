class Location < ActiveRecord::Base
  validates :current, uniqueness: {
    scope: :item_id,
    message: 'has already been set for this item'
  }, if: :current
end
