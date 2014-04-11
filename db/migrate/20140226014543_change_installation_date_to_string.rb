class ChangeInstallationDateToString < ActiveRecord::Migration
  def change
    change_column :items, :installation_date, :string
  end
end
