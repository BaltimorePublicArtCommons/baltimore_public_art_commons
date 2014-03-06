class CreateItemOrganziationDonors < ActiveRecord::Migration
  def change
    create_table :item_organziation_donors do |t|
      t.integer :item_id
      t.integer :organization_donor_id
    end
  end
end
