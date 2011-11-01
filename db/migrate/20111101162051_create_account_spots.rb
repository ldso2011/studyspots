class CreateAccountSpots < ActiveRecord::Migration

  def self.up
    create_table(:accounts_spots, :id => false) do |t|
      t.string :id, :limit => 36, :null => false, :primary => true
      t.string :account_id, :limit => 36, :null => false, :primary => true
      t.string :spot_id, :limit => 36, :null => false, :primary => true
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts_spots
  end

end