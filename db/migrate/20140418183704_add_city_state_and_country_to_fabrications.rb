class AddCityStateAndCountryToFabrications < ActiveRecord::Migration
  def change
    add_column :fabrications, :city, :string
    add_column :fabrications, :state, :string
    add_column :fabrications, :country, :string
  end
end
