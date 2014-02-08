class AddItemIdToIndividualDonors < ActiveRecord::Migration
  def change
    add_column :individual_donors, :item_id, :integer
  end
end
