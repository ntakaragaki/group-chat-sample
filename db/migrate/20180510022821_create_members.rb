class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :group_id

      add_foreign_key :members, :users
      add_foreign_key :members, :groups
    end
  end
end
