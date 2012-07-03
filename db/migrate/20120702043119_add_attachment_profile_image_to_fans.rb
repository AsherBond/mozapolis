class AddAttachmentProfileImageToFans < ActiveRecord::Migration
  def self.up
    change_table :fans do |t|
      t.has_attached_file :profile_image
    end
  end

  def self.down
    drop_attached_file :fans, :profile_image
  end
end
