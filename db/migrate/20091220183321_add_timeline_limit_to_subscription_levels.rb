class AddTimelineLimitToSubscriptionLevels < ActiveRecord::Migration
  def self.up
     add_column :subscription_levels, :timeline_limit, :integer
     SubscriptionLevel.all.each{|s|  s.timeline_limit=30; s.save}
  end

  def self.down
    remove_column :subscription_levels, :timeline_limit
  end
end
