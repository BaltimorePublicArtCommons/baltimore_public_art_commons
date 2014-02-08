class AddItemIdToDimensions < ActiveRecord::Migration
  def change
    add_column :dimensions, :item_id, :integer
  end
end
