class CreateProfiles < ActiveRecord::Migration
  
  def self.up
    create_table(:profiles, :id => false) do |t|
      t.string :account_id, :limit => 36, :null => false, :primary => true
      t.string :first_name, :limit => 40
      t.string :last_name, :limit => 40
      t.timestamps
    end
#    execute "ALTER TABLE profiles ADD PRIMARY KEY (account_id)"
#    execute "ALTER TABLE profiles ADD FOREIGN KEY (account_id) REFERENCES accounts (account_id) ON DELETE CASCADE ON UPDATE CASCADE"
  end
  
  def self.down
    drop_table :profiles
  end

end