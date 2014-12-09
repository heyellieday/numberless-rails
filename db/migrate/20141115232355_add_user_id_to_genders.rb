class AddUserIdToGenders < ActiveRecord::Migration
  def change
    add_column :genders, :user_id, :integer
  end
end
