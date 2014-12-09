class CreatePronoun < ActiveRecord::Migration
  def change
    create_table :pronoun do |t|
      t.string :subject
      t.string :object
      t.string :possessive
    end
  end
end
