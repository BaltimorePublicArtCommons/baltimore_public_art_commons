class CreateItemIndividualDonors < ActiveRecord::Migration
  def change
    create_table :item_individual_donors do |t|
      t.integer :item_id
      t.integer :individual_donor_id
    end
  end
end
