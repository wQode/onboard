class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar
      t.string :password_digest
      t.string :email
      t.boolean :is_admin, :default => false
      t.timestamps
    end
  end
end
