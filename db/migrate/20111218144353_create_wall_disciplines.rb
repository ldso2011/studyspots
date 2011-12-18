class CreateWallDisciplines < ActiveRecord::Migration
  def self.up
    create_table(:wall_disciplines, :id => false) do |t|
      t.string :wall_disciplines_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :discipline_id, :limit => 36, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.integer :user_id, :limit => 7, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.string :comment, :null => false
      t.timestamps
    end
  end
  def self.down
    drop_table :wall_disciplines
  end
end
