class AddFieldsToFans < ActiveRecord::Migration
  def change
    add_column :fans, :interests, :text
    add_column :fans, :favoriteBands, :text
    add_column :fans, :about, :text
    add_column :fans, :public_email, :string
    add_column :fans, :city, :string
    add_column :fans, :state, :string
    add_column :fans, :zip, :string
    add_column :fans, :country, :string
  end
end
