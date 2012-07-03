class AddSongIdToPtracks < ActiveRecord::Migration
  def change
    add_column :ptracks, :song_id, :integer
  end
end
