class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :ticket_cost
      t.text :about
      t.references :artist

      t.timestamps
    end
    add_index :events, :artist_id
  end

  def down
  end
end
