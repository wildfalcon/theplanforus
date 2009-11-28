require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  describe "when created" do
    before(:each) do
      @user = Factory(:user)
      SubscriptionLevel.stub!(:free).and_return(Factory.create(:subscription_level, :name=>"Free"))
    end
    
    it "should be connected to the free subscription_level" do
      @user.subscription_level.name.should == "Free"
    end
  end
  
end