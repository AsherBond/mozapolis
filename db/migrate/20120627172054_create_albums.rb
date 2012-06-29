class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.string :label
      t.text :description
      t.references :artist

      t.timestamps
    end
    add_index :albums, :artist_id
  end
end
