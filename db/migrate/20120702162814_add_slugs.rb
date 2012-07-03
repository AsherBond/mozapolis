class AddSlugs < ActiveRecord::Migration
  def up

    add_column :albums,    :slug, :string
    add_column :galleries, :slug, :string
    add_column :playlists, :slug, :string
    add_column :images,    :slug, :string
    add_column :events,    :slug, :string
    add_column :articles,  :slug, :string
    add_column :videos,    :slug, :string

  	add_index  :albums,    :slug, unique: true
  	add_index  :galleries, :slug, unique: true
  	add_index  :playlists, :slug, unique: true
  	add_index  :images,    :slug, unique: true
  	add_index  :events,    :slug, unique: true
  	add_index  :articles,  :slug, unique: true
  	add_index  :videos,    :slug, unique: true
  end

  def down
  end
end
