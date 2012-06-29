class AddAttachmentArtworkToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.has_attached_file :artwork
    end
  end

  def self.down
    drop_attached_file :albums, :artwork
  end
end
