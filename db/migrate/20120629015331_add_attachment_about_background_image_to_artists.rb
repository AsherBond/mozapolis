class AddAttachmentAboutBackgroundImageToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.has_attached_file :about_background_image
    end
  end

  def self.down
    drop_attached_file :artists, :about_background_image
  end
end
