class AddPositionToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :position, :integer
  end
end
