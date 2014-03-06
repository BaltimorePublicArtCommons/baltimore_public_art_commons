class RemoveItemIdFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :item_id
  end
end
