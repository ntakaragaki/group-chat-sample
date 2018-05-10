class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :text
      t.integer :user_id
      t.integer :group_id
      t.date :date

      add_foreign_key :chats, :users
      add_foreign_key :chats, :groups
    end
  end
end
