class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.references :artist

      t.timestamps
    end
    add_index :galleries, :artist_id
  end
end
