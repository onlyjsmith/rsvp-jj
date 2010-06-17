class Replies < ActiveRecord::Migration
  def self.up
    change_column :replies, :name, :text
  end

  def self.down
    change_column :replies, :name, :string
  end
end
