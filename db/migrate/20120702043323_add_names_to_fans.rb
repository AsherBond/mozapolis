class AddNamesToFans < ActiveRecord::Migration
  def change
    add_column :fans, :first_name, :string
    add_column :fans, :last_name, :string
  end
end
