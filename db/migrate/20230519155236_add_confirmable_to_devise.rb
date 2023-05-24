class AddConfirmableToDevise < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :confirmation_token, :string unless column_exists?(:users, :confirmation_token)
    add_column :users, :confirmed_at, :datetime unless column_exists?(:users, :confirmed_at)
    add_column :users, :confirmation_sent_at, :datetime unless column_exists?(:users, :confirmation_sent_at)
    add_column :users, :unconfirmed_email, :string unless column_exists?(:users, :unconfirmed_email) # Only if using reconfirmable
    add_index :users, :confirmation_token, unique: true unless index_exists?(:users, :confirmation_token)
    # User.reset_column_information # Uncomment this line if your project requires it
    # User.all.update_all confirmed_at: DateTime.now # Uncomment this line if your project requires it
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
