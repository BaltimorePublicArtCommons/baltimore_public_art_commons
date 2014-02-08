class CreateIndividualDonors < ActiveRecord::Migration
  def change
    create_table :individual_donors do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
