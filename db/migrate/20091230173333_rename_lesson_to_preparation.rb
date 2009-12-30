class RenameLessonToPreparation < ActiveRecord::Migration
  def self.up
    rename_table :lessons, :preparations
    add_column :preparations, :type, :string, :default=>"Lesson", :null => false
    rename_column :preparations, :teacher, :description
  end

  def self.down
    rename_table :preparations, :lessons
    remove_column :lessons, :type
    rename_column :lessons, :description, :teacher
  end
end
