class AddAttachmentNewsBackgroundImageToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.has_attached_file :news_background_image
    end
  end

  def self.down
    drop_attached_file :artists, :news_background_image
  end
end
