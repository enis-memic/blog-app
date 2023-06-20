class ModifyUsersTable < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, name: 'index_users_on_email'
    remove_index :users, name: 'index_users_on_reset_password_token'
    
    change_table :users do |t|
      t.index ['email'], name: 'index_users_on_email'
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    end
  end
end

