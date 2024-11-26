class ChangeLocationToTextInPlans < ActiveRecord::Migration[7.2]
  def change
    change_column :plans, :location, :text
  end
end
