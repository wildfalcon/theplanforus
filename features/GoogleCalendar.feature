Feature: Sync with Google Calendar
  In order to save time entering data
  As a use
  I want my lessons and events be exported as a .ical file 
  (which google can subscribe to)

Scenario: Lessons are in file
  Given a user is logged in as "markEmark"
  And "markEmark" has a plan "mark's plan"
  And There are 2 lessons in "mark's plan" with date 2009-09-09
  When I go to the ical_url for "mark's plan"
  Then I get an ical file with 2 events in it showing date 2009-09-09



