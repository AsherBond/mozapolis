class AddUsernameToFans < ActiveRecord::Migration
  def change
    add_column :fans, :username, :string
    add_column :fans, :slug, :string
  	add_index :fans, :slug, unique: true
  end
end
