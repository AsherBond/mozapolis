class AddAttachmentProfileImageToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.has_attached_file :profile_image
    end
  end

  def self.down
    drop_attached_file :artists, :profile_image
  end
end
