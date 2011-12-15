class CreateUserSpots < ActiveRecord::Migration
 def self.up
    create_table(:user_spots, :id => false) do |t|
      t.string :user_spots_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :spot_id, :limit => 36, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.integer :user_id, :limit => 7, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.timestamps
    end
  end
  def self.down
    drop_table :user_spots
  end
end
