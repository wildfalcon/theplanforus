require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
  before(:each) do
    @event = Factory.build(:event)
  end

  it "should be possible to set its date via a string" do
    @event.date_string=("2009-09-09")
    @event.date.should == Date.parse("2009-09-09")
  end

  it "should return a valid day" do
    @event.day.class.should == Day
    @event.day.date.should == @event.date
    @event.day.plan.should == @event.plan
  end
  
  it "should return a valid week" do
    @event.week.class.should == Week
    @event.week.contains?(@event.date).should == true
    @event.week.plan.should == @event.plan
  end
end
