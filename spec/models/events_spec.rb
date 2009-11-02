require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Events do
  before(:each) do
    @valid_attributes = {
      :type => "value for type",
      :name => "value for name",
      :date => Date.today,
      :plan_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Events.create!(@valid_attributes)
  end
end
