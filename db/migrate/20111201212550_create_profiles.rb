class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table(:profiles, :id => false) do |t|
      t.string :profile_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.integer :user_id, :null => false
      t.string :first_name, :limit => 50, :null => false
      t.string :last_name, :limit => 50, :null => false
      t.string :faculty_id, :limit => 36, :null => false
      t.string :course_id, :limit => 36, :null => false
      t.integer :year, :null => false
      t.string :language, :limit => 2, :null => false
      t.string :local, :limit => 150
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
  def self.down
    drop_table :profiles
  end
end
