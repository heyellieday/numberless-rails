class CreateVoicemails < ActiveRecord::Migration
  def change
    create_table :voicemails do |t|
      t.integer :call_id
      t.float :duration
      t.string :recording_url

      t.timestamps
    end
  end
end
