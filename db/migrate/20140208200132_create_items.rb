class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :material
      t.string :description
      t.integer :installation_date

      t.timestamps
    end
  end
end
