class AddAttachmentFileToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :videos, :file
  end
end
