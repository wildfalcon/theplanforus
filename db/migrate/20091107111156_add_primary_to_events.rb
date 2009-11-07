class AddPrimaryToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :primary, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :events, :primary
  end
end
