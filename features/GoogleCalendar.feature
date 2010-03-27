Feature: Sync with Google Calendar
  In order to save time entering data
  As a use
  I want my lessons and events be exported as a .ical file 
  (which google can subscribe to)

Scenario: Lessons are in file
  Given a user is logged in as "markEmark"
  And "markEmark" has a plan "mark's plan"
  When I create a lesson in "mark's plan" with "Mindy" on "2009-09-09" from "13:30" to "15:00" 
  And I create a lesson in "mark's plan" with "Mork" on "2009-09-09" from "15:00" to "16:30" 
  And I go to the ical_url for "mark's plan"
  Then I get an ical file with 2 events in it showing date 2009-09-09



