class CreateOrganizationalDonors < ActiveRecord::Migration
  def change
    create_table :organizational_donors do |t|
      t.string :name

      t.timestamps
    end
  end
end
