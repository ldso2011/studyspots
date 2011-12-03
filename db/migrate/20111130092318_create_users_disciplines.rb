class CreateUsersDisciplines < ActiveRecord::Migration
  def self.up
    create_table(:users_disciplines, :id => false) do |t|
      t.string :users_disciplines_id, :limit => 36, :null => false, :primary => true, :on_delete => :cascade, :on_update => :cascade
      t.string :discipline_id, :limit => 36, :null => false
      t.integer :user_id, :limit => 7, :null => false
      t.timestamps
    end
  end
  def self.down
    drop_table :users_disciplines
  end
end
