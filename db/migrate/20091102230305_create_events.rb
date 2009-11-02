class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :kind
      t.string :name
      t.date :date
      t.integer :plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
