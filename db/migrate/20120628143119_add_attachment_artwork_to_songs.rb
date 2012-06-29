class AddAttachmentArtworkToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.has_attached_file :artwork
    end
  end

  def self.down
    drop_attached_file :songs, :artwork
  end
end
