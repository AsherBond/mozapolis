class AddAttachmentMainBackgroundImageToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.has_attached_file :main_background_image
    end
  end

  def self.down
    drop_attached_file :artists, :main_background_image
  end
end
