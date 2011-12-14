class CreateUserDisciplines < ActiveRecord::Migration
  def self.up
    create_table(:user_disciplines, :id => false) do |t|
      t.string :user_disciplines_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :discipline_id, :limit => 36, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.integer :user_id, :limit => 7, :null => false, :on_delete => :cascade, :on_update => :cascade
      t.timestamps
    end
  end
  def self.down
    drop_table :user_disciplines
  end
end
