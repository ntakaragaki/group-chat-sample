class AddLastApiReceiveTimeToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :last_api_receive_time, :datetime
  end
end
