class AddThumbnailTextColor < ActiveRecord::Migration
  def up
  	add_column :artists, :thumbnails_text_color, :string
  end

  def down
  end
end
