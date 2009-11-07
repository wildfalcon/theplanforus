class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.datetime :start
      t.datetime :end
      t.string :teacher

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
