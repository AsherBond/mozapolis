class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :album
      t.string :title
      t.text :lyrics
      t.integer :track_number
      t.string :featured_artist

      t.timestamps
    end
    add_index :songs, :album_id
  end
end
