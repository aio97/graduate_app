class AddLatitudeAndLongitudeToPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :plans, :latitude, :float
    add_column :plans, :longitude, :float
  end
end
