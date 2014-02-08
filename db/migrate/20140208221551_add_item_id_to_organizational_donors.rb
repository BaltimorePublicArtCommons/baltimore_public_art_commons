class AddItemIdToOrganizationalDonors < ActiveRecord::Migration
  def change
    add_column :organizational_donors, :item_id, :integer
  end
end
