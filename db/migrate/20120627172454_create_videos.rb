class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.boolean :is_youtube
      t.string :youtube_code
      t.references :artist

      t.timestamps
    end
    add_index :videos, :artist_id
  end
end
