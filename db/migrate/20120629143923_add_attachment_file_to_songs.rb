class AddAttachmentFileToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :songs, :file
  end
end
