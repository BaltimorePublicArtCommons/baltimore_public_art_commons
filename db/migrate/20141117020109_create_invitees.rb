class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
