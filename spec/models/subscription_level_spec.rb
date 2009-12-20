require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubscriptionLevel do
  before(:each) do
    @sub_level = Factory.build(:subscription_level)
  end
  
  describe "validations" do
    it "should be valid by default" do
      @sub_level.should be_valid
    end
    
    it "should be invalid without allowed plans" do
      @sub_level.allowed_plans=nil
      @sub_level.should_not be_valid
    end
  
    it "should be invalid without a timeline limit" do
      @sub_level.timeline_limit=nil
      @sub_level.should_not be_valid      
    end
  end
end