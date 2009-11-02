require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Plan do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :ical_feed => "value for ical_feed"
    }
    
    @plan = Plan.create!(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Plan.create!(@valid_attributes)
  end
  
  it "should return a list of 180 days" do
    @plan.days.class.should == Array
    @plan.days.size.should == 180
  end
end
