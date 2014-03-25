class CreateItemArtists < ActiveRecord::Migration
  def change
    create_table :item_artists do |t|
      t.integer :item_id
      t.integer :artist_id
    end
  end
end
