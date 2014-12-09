class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expertise, :string
    add_column :users, :summary, :text
    add_column :users, :organization, :string
    add_column :users, :location, :string
    add_column :users, :years_in_transition, :integer
  end
end
