class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.date :date
      t.time :start
      t.time :end
      t.string :teacher
      t.integer :plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
