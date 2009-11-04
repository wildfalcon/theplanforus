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

  it "should know if it has a major event in" do
    @week.events << Factory.build(:event, {:date => Date.parse("2010-01-01")})
    @week.has_major_event?.should == true
  end

  it "should be able to return its major event" do
    event = Factory.build(:event, {:date => Date.parse("2010-01-01")})
    @week.events << event
    @week.major_event.should==event
  end

  it "should know if it has a minor event in" do
    @week.events << Factory.build(:event, {:date => Date.parse("2010-01-01"), :kind => "minor"})
    @week.has_minor_event?.should == true
  end

  it "should be able to return its minor event" do
    event = Factory.build(:event, {:date => Date.parse("2010-01-01"), :kind => "minor"})
    @week.events << event
    @week.minor_event.should==event
  end
  
end
