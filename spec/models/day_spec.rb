require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Day do
  before(:each) do
    @day = Factory.build(:day, :date => Date.parse("2010-01-01"))
  end
  
  it "should know if it contains a primary event" do
     @day.events << Factory.build(:event, {:date => Date.parse("2010-01-01")})
     @day.has_primary_event?.should == true
   end

   it "should be able to list its primary events" do
     event = Factory.build(:event, {:date => Date.parse("2010-01-01")})
     @day.events << event
     @day.primary_events.should be_include(event)
   end

   it "should know if it has an event in" do
     @day.events << Factory.build(:event, {:date => Date.parse("2010-01-01"), :primary => false})
     @day.has_event?.should == true
   end

   it "should be able to return its events" do
     event = Factory.build(:event, {:date => Date.parse("2010-01-01"), :primary => false})
     @day.events << event
     @day.events.should be_include(event)
   end

   it "should if it has a lesson" do
     lesson_1 = Factory.create(:lesson, {:start => Date.parse("2010-01-01").to_time})
     lesson_2 = Factory.create(:lesson, {:start => Date.parse("2010-01-01").to_time})
     @day.has_lesson?.should == true
   end
    
   it "should know how many lessons it has" do
     lesson_1 = Factory.create(:lesson, {:start => Date.parse("2010-01-01").to_time})
     lesson_2 = Factory.create(:lesson, {:start => Date.parse("2010-01-01").to_time})
     @day.lessons.size.should == 2
   end

  
end