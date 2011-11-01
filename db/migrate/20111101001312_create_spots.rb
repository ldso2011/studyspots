class CreateSpots < ActiveRecord::Migration

  def self.up
    create_table(:spots, :id => false) do |t|
      t.string :spot_id, :limit => 36, :null => false, :primary => true
      t.string :owner_id, :limit => 36, :null => false, :primary => true
      t.string :local, :limit => 40, :null => false
      t.datetime :start_time, :null => false
      t.datetime :end_time, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :spots
  end

end