class AddUserIdToPronoun < ActiveRecord::Migration
  def change
    add_column :pronoun, :user_id, :integer
  end
end
