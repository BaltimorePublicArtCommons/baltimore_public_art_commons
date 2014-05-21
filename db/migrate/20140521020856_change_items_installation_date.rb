class ChangeItemsInstallationDate < ActiveRecord::Migration
  def change
    rename_column :items, :installation_date, :installation_start_date
    add_column :items, :installation_end_date, :integer
  end
end
