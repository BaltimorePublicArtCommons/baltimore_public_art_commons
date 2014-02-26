class AddAttachmentImageToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :items, :image
  end
end
