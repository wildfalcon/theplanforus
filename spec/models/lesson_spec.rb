require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lesson do
  before(:each) do
    @valid_attributes = {
      :start => Time.now,
      :end => Time.now,
      :teacher => "value for teacher"
    }
  end

  it "should create a new instance given valid attributes" do
    Lesson.create!(@valid_attributes)
  end
end
