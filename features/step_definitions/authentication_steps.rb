Given /^a user is logged in as "(.*)"$/ do |login|
  @current_user = User.create!(
    :username => login,
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "#{login}@example.com"
  )
  # @current_user.activate! 

  visit "/login" 
  fill_in("Username", :with => login) 
  fill_in("password", :with => 'generic') 
  click_button("Login")
  response.body.should =~ /Successfully logged in./m  
end