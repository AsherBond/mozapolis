class CreatePolymorphicComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :poster_type
      t.integer :artist_id
      t.integer :fan_id
      t.integer :user_id
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :user_id
    add_index :comments, :artist_id
    add_index :comments, :fan_id
  end
end
