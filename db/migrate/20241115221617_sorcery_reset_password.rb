class SorceryResetPassword < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :access_count_to_reset_password_page, :integer, default: 0

  end
end
