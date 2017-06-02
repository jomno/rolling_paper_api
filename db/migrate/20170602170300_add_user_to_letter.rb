class AddUserToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :user_id, :integer
  end
end
