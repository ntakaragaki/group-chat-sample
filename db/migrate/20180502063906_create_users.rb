class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login_id, :null => false
      t.string :password
      t.timestamps
    end
  end
end
