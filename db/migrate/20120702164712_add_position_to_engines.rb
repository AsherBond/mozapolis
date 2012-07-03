class AddPositionToEngines < ActiveRecord::Migration
  def change
    add_column :galleries, :position, :integer
    add_column :ptracks, :position, :integer
    add_column :playlists, :position, :integer
    add_column :videos, :position, :integer
    add_column :events, :position, :integer
    add_column :articles, :position, :integer
  end
end
