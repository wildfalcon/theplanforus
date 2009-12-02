class AddConfirmationRecordsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
  end

  def self.down
    remove_column :users, :confirmation_sent_at
    remove_column :users, :confirmed_at
  end
end
