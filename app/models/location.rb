class Location < ActiveRecord::Base
  include PgSearch

  multisearchable against: [:neighborhood]

  validates :current, uniqueness: {
    scope: :item_id,
    message: 'has already been set for this item'
  }, if: :current_and_item_id_present?

  def self.current
    where(current: true).first
  end

  private

  def current_and_item_id_present?
    current && item_id
  end
end
