class CreateWallSpots < ActiveRecord::Migration
  def self.up
    create_table(:wall_spots, :id => false) do |t|
      t.string :wall_spots_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :spot_id, :limit => 36, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.integer :user_id, :limit => 7, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.string :comment, :null => false
      t.timestamps
    end
  end
  def self.down
    drop_table :wall_spots
  end
end
