class CreateAccounts < ActiveRecord::Migration

  def self.up
    create_table(:accounts, :id => false) do |t|
      t.string :account_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :username, :limit => 50, :null => false
      t.string :password, :limit => 32,  :null => false
      t.boolean :sex
      t.string :email, :limit => 50, :null => false
      t.integer :account_level, :null => false
      t.integer :account_state, :null => false
      t.date :birthdate
      t.integer :login_count, :null => false
      t.datetime :unban_time
      t.datetime :expiration_time
      t.datetime :last_login
      t.string :last_ip, :limit => 15
      t.timestamps
    end
#    execute "ALTER TABLE accounts ADD PRIMARY KEY (account_id)"
#    execute "ALTER TABLE accounts ADD UNIQUE (username)"
#    execute "ALTER TABLE accounts ADD UNIQUE (email)"
  end

  def self.down
    drop_table :accounts
  end

end