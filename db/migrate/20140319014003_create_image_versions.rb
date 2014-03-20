class CreateImageVersions < ActiveRecord::Migration
  def change
    create_table :image_versions do |t|
      t.string :file
      t.string :version
      t.integer :image_id

      t.timestamps
    end
  end
end
