class Artist < ActiveRecord::Base
  include PgSearch

  has_one :image, as: :imageable

  multisearchable against: [:first_name, :last_name]

  def birth_date
    PartialDateLoader.load(self, :birth_date)
  end

  def deceased_date
    PartialDateLoader.load(self, :deceased_date)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
