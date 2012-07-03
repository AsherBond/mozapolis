class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :fan

      t.timestamps
    end
    add_index :playlists, :fan_id
  end
end
