class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :birth_date
      t.integer :deceased_date
      t.string :title

      t.timestamps
    end
  end
end
