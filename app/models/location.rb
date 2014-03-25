class Location < ActiveRecord::Base
  include PgSearch

  multisearchable against: [:neighborhood]

  validates :current, uniqueness: {
    scope: :item_id,
    message: 'has already been set for this item'
  }, if: :current

  def self.current
    where(current: true).first
  end
end
