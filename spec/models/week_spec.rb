require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Week do
  before(:each) do
    @week = Factory.build(:week, :date => Date.parse("2010-01-01"))
  end

  it "should have a start date at the begining of this week" do
    @week.start_date.should == Date.parse("2010-01-01").beginning_of_week
  end

  it "should know today is in the week" do
    @week.contains?(Date.parse("2010-01-01")).should == true
  end

  it "should recognise the first day of a week" do
    # 3rd is last day of this week
    @week.contains?(Date.parse("2009-12-28")).should == true 
  end
  
  it "should recognise the last day of a week" do
    # 3rd is last day of this week
    @week.contains?(Date.parse("2010-01-03")).should == true 
  end

  it "should know if it contains a primary event" do
    @week.events << Factory.build(:event, {:date => Date.parse("2010-01-01")})
    @week.has_primary_event?.should == true
  end

  it "should be able to list its primary events" do
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
  
  it "should know how many lessons it has" do                            
    lesson_1 = Factory.create(:lesson, {:date => Date.parse("2010-01-01"), :plan => @week.plan})
    lesson_2 = Factory.create(:lesson, {:date => Date.parse("2010-01-01"), :plan => @week.plan})
    @week.lessons.size.should == 2
  end

   it "should know how many events it has" do
     Factory.create(:event, {:date => Date.parse("2010-01-01"), :plan => @week.plan})
     Factory.create(:event, {:date => Date.parse("2010-01-01"), :plan => @week.plan})
     @week.events.size.should == 2                                         
   end
  
  it "should be able to work out its html id" do
    @week.html_id.should=="week_#{@week.number}"
  end
  
end
