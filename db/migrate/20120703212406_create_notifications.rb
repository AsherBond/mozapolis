class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notify_type
      t.string :user_type
      t.integer :notify_object
      t.integer :artist_id
      t.integer :fan_id
      t.string :message
      t.integer :notify_user



      t.timestamps
    end
  end
end
