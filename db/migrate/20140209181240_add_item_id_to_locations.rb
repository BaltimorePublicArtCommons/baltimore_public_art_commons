class AddItemIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :item_id, :integer
  end
end
