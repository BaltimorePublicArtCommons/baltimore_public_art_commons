class ItemOrganizationalDonor < ActiveRecord::Base
  belongs_to :item
  belongs_to :organizational_donor
end
