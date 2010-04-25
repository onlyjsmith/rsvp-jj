class RenameEngagment < ActiveRecord::Migration
  def self.up
    rename_column :replies, :engagment_adults, :engagement_adults
  end

  def self.down
    rename_column :replies, :engagement_adults, :engagment_adults
  end
end
