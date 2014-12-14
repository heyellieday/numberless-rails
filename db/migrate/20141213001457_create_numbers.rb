class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :user_id
      t.string :number

      t.timestamps
    end
  end
end
