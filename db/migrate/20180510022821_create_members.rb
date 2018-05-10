class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :group_id

      add_foreign_key :members, :user
      add_foreign_key :members, :group
    end
  end
end
