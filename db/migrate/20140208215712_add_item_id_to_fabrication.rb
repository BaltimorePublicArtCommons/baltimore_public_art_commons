class AddItemIdToFabrication < ActiveRecord::Migration
  def change
    add_column :fabrications, :item_id, :integer
  end
end
