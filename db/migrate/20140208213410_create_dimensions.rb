class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.float :height
      t.float :width
      t.float :depth

      t.timestamps
    end
  end
end
