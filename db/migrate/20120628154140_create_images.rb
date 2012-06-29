class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :alt
      t.references :gallery

      t.timestamps
    end
    add_index :images, :gallery_id
  end
end
