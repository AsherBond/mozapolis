class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :title
      t.references :artist
      t.text :content

      t.timestamps
    end
    add_index :articles, :artist_id
  end

  def down
  end
end
