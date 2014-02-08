class AddItemIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :item_id, :integer
  end
end
