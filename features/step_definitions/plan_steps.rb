Given /^"([^\"]*)" has a plan "([^\"]*)"$/ do |username, plan_name|
  user = User.find_by_username(username)
  plan = Factory.build(:plan, :user => user, :name => plan_name)
  plan.save
end

Then /^I see that week 36 contains two lessons$/ do
  pending # express the regexp above with the code you wish you had
end
