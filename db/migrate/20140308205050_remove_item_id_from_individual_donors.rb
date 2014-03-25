class RemoveItemIdFromIndividualDonors < ActiveRecord::Migration
  def change
    remove_column :individual_donors, :item_id
  end
end
