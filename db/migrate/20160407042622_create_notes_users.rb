class CreateNotesUsers < ActiveRecord::Migration
  def change
    create_table :notes_users do |t|
      t.integer :user_id
      t.integer :notes_id
      t.timestamps
    end
  end
end
