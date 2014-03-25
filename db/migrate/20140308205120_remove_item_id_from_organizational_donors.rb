class RemoveItemIdFromOrganizationalDonors < ActiveRecord::Migration
  def change
    remove_column :organizational_donors, :item_id
  end
end
