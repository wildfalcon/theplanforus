Feature: Daily View
  In order See the day-day plans
  As a user
  I want to see a list of days, showing competitions and lessons

Background:
  Given a user is logged in as "markEmark"
  And "markEmark" has a plan "mark's plan"
  When I create a lesson in "mark's plan" with "Mindy" on "2009-09-09" from "13:30" to "15:00" 
  When I create a lesson in "mark's plan" with "Mork" on "2009-09-09" from "15:00" to "16:30" 
  When I create an event in "mark's plan" called "The Ork Open" on "2009-09-09"

Scenario: Viewing number of competitions in a week
  When I go to the plans page
  And follow "mark's plan"
  And follow "Daily"
  And fill in "07/01/2009" for "start" 
  And fill in "12/01/2009" for "end"  
  And press "Display"
  Then I should see "Mindy" within "#day_2009_252 .lessons"
  And I should see "Mork" within "#day_2009_252 .lessons"

Scenario: Viewing events in a week
  When I go to the plans page
  And follow "mark's plan"
  And follow "Daily"
  And fill in "07/01/2009" for "start" 
  And fill in "12/01/2009" for "end"  
  And press "Display"
  Then I should see "The Ork Open" within "#day_2009_252 .events"

