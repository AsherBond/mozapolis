class AddAttachmentBodyBackgroundImageToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.has_attached_file :body_background_image
    end
  end

  def self.down
    drop_attached_file :artists, :body_background_image
  end
end
