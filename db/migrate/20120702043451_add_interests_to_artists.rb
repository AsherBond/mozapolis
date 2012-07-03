class AddInterestsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :interests, :text
  end
end
