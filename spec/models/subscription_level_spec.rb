require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubscriptionLevel do
  before(:each) do
    @sub_level = Factory.build(:subscription_level)
  end
  
  it "should have defined a number of plans" do
    @sub_level.number_of_plans.should == 1
  end
  
end