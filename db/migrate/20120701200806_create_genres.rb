class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.references :artist

      t.timestamps
    end
    add_index :genres, :artist_id
  end
end
