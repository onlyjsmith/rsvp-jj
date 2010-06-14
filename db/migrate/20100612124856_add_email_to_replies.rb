class AddEmailToReplies < ActiveRecord::Migration
  def self.up
    add_column :replies, :email, :string
  end

  def self.down
    remove_column :replies, :email
  end
end
