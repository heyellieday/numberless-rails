class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.string :from
      t.float :duration

      t.timestamps
    end
  end
end
