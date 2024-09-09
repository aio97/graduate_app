class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :image
      t.string :outline_title
      t.text :outline_body
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_public, null: false, default: false
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
