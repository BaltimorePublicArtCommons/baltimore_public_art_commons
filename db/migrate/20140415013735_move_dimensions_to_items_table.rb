class MoveDimensionsToItemsTable < ActiveRecord::Migration
  def change
    drop_table :dimensions do |t|
      t.float :height
      t.float :width
      t.float :depth
      t.integer :item_id

      t.timestamps
    end

    change_table :items do |t|
      t.float :height
      t.float :width
      t.float :depth
    end
  end
end
