class CreateFaculties < ActiveRecord::Migration
  def self.up
    create_table(:faculties, :id => false) do |t|
      t.string :faculty_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :name, :limit => 100,  :null => false
      t.string :acronym, :limit => 10, :null => false
      t.boolean :faculty_type, :null => false
      t.string :url, :limit => 100, :null => false
      t.string :address, :limit => 150
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
  def self.down
    drop_table :faculties
  end
end
