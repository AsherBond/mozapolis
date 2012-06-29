class AddAttachmentCoverToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.has_attached_file :cover
    end
  end

  def self.down
    drop_attached_file :galleries, :cover
  end
end
