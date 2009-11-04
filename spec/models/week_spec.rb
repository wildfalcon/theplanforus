require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Week do
  before(:each) do
    @week = Week.new(Time.now.to_date)
  end

  it "should have a start date at the begining of this week" do
    @week.start_date.should == Time.now.to_date.beginning_of_week
  end
  
  it "should know today is in the week" do
    @week.contains?(Time.now.to_date).should == true
  end

end
