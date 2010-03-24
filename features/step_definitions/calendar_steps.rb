Given /^There are (\d) lessons in "([^\"]*)"$/ do |number_of_lessons, plan_name|
  plan = Plan.find_by_name(plan_name)
  1.upto(number_of_lessons.to_i) do
     lesson = Factory.build(:lesson)
      lesson.save
  end
end

Then /^I get an ical file with 2 lessons in it$/ do
  pending # express the regexp above with the code you wish you had
end
