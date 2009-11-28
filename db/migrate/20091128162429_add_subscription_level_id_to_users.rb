class AddSubscriptionLevelIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :subscription_level_id, :integer
  end

  def self.down
    remove_column :users, :subscription_level_id
  end
end
