class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :nav_title
      t.text :meta_description
      t.integer :position
      t.text :content

      t.timestamps
    end
  end
end
