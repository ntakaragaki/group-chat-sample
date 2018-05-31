class AddGroupAppIdToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :group_app_id, :string
  end
end
