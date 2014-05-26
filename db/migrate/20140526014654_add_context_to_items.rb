class AddContextToItems < ActiveRecord::Migration
  def change
    add_column :items, :context, :text
  end
end
