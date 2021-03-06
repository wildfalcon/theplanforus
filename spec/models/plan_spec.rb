require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Plan do
  before(:each) do
    @plan = Factory.create(:plan)
  end
  
  describe "validations on create" do
    before(:each) do
      @plan = Factory.build(:plan)
    end
    
    it "should not be valid on create if its a new record, and the user already has full plans" do
      @plan.user.stub!(:plans).and_return [Factory.build(:plan)]
      @plan.user.stub!(:allowed_plans).and_return(1)
      @plan.should_not be_valid
    end
  end
  
  it "should know how many upcoming events there are" do
    @plan.events.create(:date => (Time.now+1.day))
    @plan.events.create(:date => (Time.now-1.day))
    @plan.events.upcoming.size.should==1
  end

  it "should know how many upcoming lessons there are" do
    @plan.lessons.create(:date => (Time.now+1.day))
    @plan.lessons.create(:date => (Time.now-1.day))
    @plan.lessons.upcoming.size.should==1
  end

  describe "when looking at days" do    
    it "should return an array" do
      @plan.days.class.should == Array
    end

    it "should return day objects" do
      @plan.days.first.class.should == Day
    end

    it "should return the number of days in the subscription level" do
      @plan.user.stub!(:timeline_limit).and_return(30)
      @plan.days.size.should == 30
    end
  end

  describe "when looking at weeks" do
    it "should return an array" do
      @plan.weeks.class.should == Array      
    end

    it "should return week obejects" do
      @plan.weeks.first.class.should == Week
    end

    it "should return as many weeks as necessary to cover the number of days in the subscription level" do
      @plan.user.stub!(:timeline_limit).and_return(30)
      @plan.weeks.last.start_date.should == (Time.now+30.days).beginning_of_week.to_date
    end

    it "should start this week" do
      @plan.weeks.first.contains?(Time.now.to_date).should == true
    end

    it "should continue at one week per week" do
      @plan.weeks.second.contains?(Time.now.to_date+1.week).should == true
    end

  end
end
