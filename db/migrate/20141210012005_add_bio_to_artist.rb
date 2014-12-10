class AddBioToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :bio, :text
    add_column :artists, :bio_source, :string
  end
end
