class CleanupOrganizationalDonorTables < ActiveRecord::Migration
  def change
    rename_column :item_organziation_donors, :organization_donor_id,
      :organizational_donor_id
    rename_table :item_organziation_donors, :item_organizational_donors
  end
end
