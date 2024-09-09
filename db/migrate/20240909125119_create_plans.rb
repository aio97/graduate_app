class CreatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.date :date
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.string :icon
      t.string :location
      t.string :location_url
      t.text :detail
      t.text :memo
      t.decimal :cost
      t.boolean :cost_display_per
      t.boolean :cost_display_total
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
