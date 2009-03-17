class CreateAchievementTables < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :value, :integer, :default => 0
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end
    
    create_table :achievement_relations do |t|
      t.column :achievement_id, :integer
      t.column :item_id, :integer
      t.column :item_type, :string
      t.column :created_on, :datetime
      t.column :updated_on, :datetime
    end
  end
 
  def self.down
    drop_table :achievements
    drop_table :achievement_relations
  end
end