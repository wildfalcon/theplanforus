class RenameNumberOfPlansToAllowedPlans < ActiveRecord::Migration
  def self.up
    rename_column :subscription_levels, :number_of_plans, :allowed_plans
  end

  def self.down
        rename_column :subscription_levels, :allowed_plans, :number_of_plans
  end
end
