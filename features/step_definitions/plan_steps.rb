Given /^"([^\"]*)" has a plan "([^\"]*)"$/ do |username, plan_name|
  user = User.find_by_username(username)
  plan = Factory.build(:plan, :user => user, :name => plan_name)
  plan.save
end

When /^I create a lesson in "([^\"]*)" with "([^\"]*)" on "(\d+\-\d+\-\d+)" from "([^\"]*)" to "([^\"]*)"$/ do |plan_name, teacher, date, start_time, end_time|
  steps %Q{
      When I go to the plans page
      And follow "#{plan_name}"
      And follow "Lessons"
      And fill in "Description" with "#{teacher}"
      And fill in "Date" with "#{date}"
      And select "#{start_time}" as the "start" time
      And select "#{end_time}" as the "end" time
      And press "Book Lesson"
    }
end

When /^I create an event in "([^\"]*)" called "([^\"]*)" on "(\d+\-\d+\-\d+)"$/ do |plan_name, name, date|
  steps %Q{
      When I go to the plans page
      And follow "#{plan_name}"
      And follow "Events"
      And fill in "Name" with "#{name}"
      And fill in "Date" with "#{date}"
      And press "Book Event"
    }
end
