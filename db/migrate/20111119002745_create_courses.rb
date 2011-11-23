class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table(:courses, :id => false) do |t|
      t.string :course_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :faculty_id, :limit => 36, :null => false
      t.string :name, :limit => 100,  :null => false
      t.string :acronym, :limit => 10, :null => false
      t.integer :degree, :null => false
      t.string :begin, :null => false
      t.timestamps
    end
  end
  def self.down
    drop_table :courses
  end
end
