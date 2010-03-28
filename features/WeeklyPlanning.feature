Feature: Weekly View
  In order See the long time plans
  As a user
  I want to see a list of weeks, showing competitions and lessons

Background:
  Given a user is logged in as "markEmark"
  And "markEmark" has a plan "mark's plan"
  When I create a lesson in "mark's plan" with "Mindy" on "2009-09-09" from "13:30" to "15:00" 
  When I create a lesson in "mark's plan" with "Mork" on "2009-09-09" from "15:00" to "16:30" 
  When I create an event in "mark's plan" called "The Ork Open" on "2009-09-16"

Scenario: Viewing number of competitions in a week
  When I go to the plans page
  And follow "mark's plan"
  And follow "Weekly"
  And fill in "07/01/2009" for "start" 
  And fill in "12/01/2009" for "end"  
  And press "Display"
  Then I should see "2" within "#week_36 .lessons"

Scenario: Viewing events in a week
  When I go to the plans page
  And follow "mark's plan"
  And follow "Weekly"
  And fill in "07/01/2009" for "start" 
  And fill in "12/01/2009" for "end"  
  And press "Display"
  Then I should see "The Ork Open" within "#week_37 .events"

