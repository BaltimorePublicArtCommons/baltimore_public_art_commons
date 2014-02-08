class CreateFabrications < ActiveRecord::Migration
  def change
    create_table :fabrications do |t|
      t.integer :date
      t.string :fabricator

      t.timestamps
    end
  end
end
