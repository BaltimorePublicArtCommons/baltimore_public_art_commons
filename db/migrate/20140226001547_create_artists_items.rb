class CreateArtistsItems < ActiveRecord::Migration
  def change
    create_table :artists_items do |t|
      t.belongs_to :artist
      t.belongs_to :item
      t.string :contribution, null: true
    end
  end
end
