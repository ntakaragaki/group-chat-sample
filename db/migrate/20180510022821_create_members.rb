class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :user_id, :null => false
      t.integer :group_id, :null => false

      add_foreign_key :members, :users
      add_foreign_key :members, :groups
    end
  end
end
