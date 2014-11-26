class ChangeArtistItemIdToImageableId < ActiveRecord::Migration
  def up
    rename_column :images, :item_id, :imageable_id
    add_column :images, :imageable_type, :string
    Image.update_all imageable_type: 'Item'
  end

  def down
    rename_column :images, :imageable_id, :item_id
    remove_column :images, :imageable_type
  end
end
