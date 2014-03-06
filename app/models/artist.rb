class Artist < ActiveRecord::Base
  include PgSearch

  multisearchable against: [:first_name, :last_name]
end
