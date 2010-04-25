class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string :name
      t.boolean :engagement
      t.integer :engagment_adults
      t.integer :engagement_children
      t.boolean :wedding
      t.integer :wedding_adults
      t.integer :wedding_children
      t.boolean :camping
      t.string :diet
      t.string :notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :replies
  end
end
