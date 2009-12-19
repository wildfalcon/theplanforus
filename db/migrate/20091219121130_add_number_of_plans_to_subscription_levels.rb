class AddNumberOfPlansToSubscriptionLevels < ActiveRecord::Migration
  def self.up
    add_column :subscription_levels, :number_of_plans, :integer
    SubscriptionLevel.all.each{|s| s.number_of_plans=1; s.save}
  end

  def self.down
    remove_column :subscription_levels, :number_of_plans
  end
end
