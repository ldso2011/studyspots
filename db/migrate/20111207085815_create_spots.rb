class CreateSpots < ActiveRecord::Migration
  def self.up
    create_table(:spots, :id => false) do |t|
      t.string :spot_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :discipline_id, :limit => 36, :null => false
      t.string :user_id, :null => false
      t.string :name, :null => false
      t.string :local, :limit => 50, :null => false
      t.string :address, :limit => 150
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
  def self.down
    drop_table :spots
  end
end
