class ChangeItemsDescriptionToGenre < ActiveRecord::Migration
  def change
    rename_column :items, :description, :genre
  end
end
