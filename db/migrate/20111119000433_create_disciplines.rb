class CreateDisciplines < ActiveRecord::Migration
  def self.up
    create_table(:disciplines, :id => false) do |t|
      t.string :discipline_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :code, :limit => 7, :null => false
      t.string :name, :limit => 100,  :null => false
      t.string :acronym, :limit => 10, :null => false
      t.string :course_id, :limit => 36, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.integer :semester, :null => false
      t.integer :year, :null => false
      t.timestamps
    end
  end
  def self.down
    drop_table :disciplines
  end
end
