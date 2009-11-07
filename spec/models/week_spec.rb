require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Week do
  before(:each) do
    @week = Factory.build(:week)
  end

  it "should have a start date at the begining of this week" do
    @week.start_date.should == Date.parse("2010-01-01").beginning_of_week
  end

  it "should know today is in the week" do
    @week.contains?(Date.parse("2010-01-01")).should == true
  end

  it "should know if it contains a primary event" do
    @week.events << Factory.build(:event, {:date => Date.parse("2010-01-01")})
    @week.has_primary_event?.should == true
  end

  it "should be able to list its major events" do
    event = Factory.build(:event, {:date => Date.parse("2010-01-01")})
    @week.events << event
    @week.primary_events.should be_include(event)
  end

  it "should know if it has an event in" do
    @week.events << Factory.build(:event, {:date => Date.parse("2010-01-01"), :primary => false})
    @week.has_event?.should == true
  end

  it "should be able to return its events" do
    event = Factory.build(:event, {:date => Date.parse("2010-01-01"), :primary => false})
    @week.events << event
    @week.events.should be_include(event)
  end
  
end
