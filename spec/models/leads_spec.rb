require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lead do
  before(:each) do
    @lead = Factory.create(:lead)
  end

  it "should be valid by default" do
    @lead.should be_valid
  end
  
  it "should not be valid if duplicate email" do
    lead2 = Factory.build(:lead, :email => @lead.email)
    lead2.should_not be_valid
  end
  
end
