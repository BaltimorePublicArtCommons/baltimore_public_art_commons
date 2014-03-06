class ItemIndividualDonor < ActiveRecord::Base
  belongs_to :item
  belongs_to :individual_donor
end
