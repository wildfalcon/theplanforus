Feature: Weekly View
  In order See the long time plans
  As a user
  I want to see a list of weeks, showing competitions and lessons

Background:
  Given a user is logged in as "markEmark"
  And "markEmark" has a plan "mark's plan"
  And There are 2 lessons in "mark's plan" with date 2009-09-09
  
Scenario: Viewing number of competitions in a week
  When I go to the plans page
  And follow "mark's plan"
  And follow "Weekly"
  And fill in "07/01/2009" for "start" 
  And fill in "12/01/2009" for "end"  
  And press "Display"
  Then I should see "2" within "#week_36 .lessons"


