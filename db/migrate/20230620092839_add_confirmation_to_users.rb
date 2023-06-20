class AddConfirmationToUsers < ActiveRecord::Migration[7.0]
  def up
    # Add the new columns with NULL email values allowed
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string

    # Add the unique index with the where clause
    add_index :users, :email, unique: true, name: 'index_users_on_email', where: "email <> ''"
  end

  def down
    # Remove the new columns and unique index
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :unconfirmed_email
    remove_index :users, name: 'index_users_on_email'
  end
end
