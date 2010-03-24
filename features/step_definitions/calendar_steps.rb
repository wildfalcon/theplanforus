Given /^There are (\d) lessons in "([^\"]*)" with date (\d+\-\d+\-\d+)$/ do |number_of_lessons, plan_name, date|
  plan = Plan.find_by_name(plan_name)
  1.upto(number_of_lessons.to_i) do
     lesson = Factory.build(:lesson, :plan => plan, :date => Date.parse(date))
      lesson.save
  end
  plan.save!
end

Then /^I get an ical file with (\d) events in it showing date (\d+\-\d+\-\d+)$/ do |number_of_events, date|  
  cal = Icalendar.parse(response.body).first
  cal.events.count.should == number_of_events.to_i
  
  cal.events.each do |event|
    event.start.to_date.should == Date.parse(date)
  end
end
