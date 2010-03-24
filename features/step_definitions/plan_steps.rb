Given /^"([^\"]*)" has a plan "([^\"]*)"$/ do |username, plan_name|
  user = User.find_by_username(username)
  plan = Factory.build(:plan, :user => user, :name => plan_name)
  plan.save
end
