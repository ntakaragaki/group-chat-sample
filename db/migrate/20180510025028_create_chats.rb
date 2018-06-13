class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :text
      t.integer :user_id, :null => false
      t.integer :group_id, :null => false
      t.timestamps

      # TODO: なぜかHerokuではCREATE TABLEの前にALTER TABLEしてしまう。
      # add_foreign_key :chats, :users
      # add_foreign_key :chats, :groups
    end
  end
end
