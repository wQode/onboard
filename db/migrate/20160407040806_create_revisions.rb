class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :document_id
      t.integer :classification_id
      t.integer :user_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
