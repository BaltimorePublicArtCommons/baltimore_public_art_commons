class Artist < ActiveRecord::Base
  include PgSearch

  multisearchable against: [:first_name, :last_name]

  def birth_date
    PartialDateLoader.load(self, :birth_date)
  end

  def deceased_date
    PartialDateLoader.load(self, :deceased_date)
  end
end
