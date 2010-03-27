
Then /^I get an ical file with (\d) events in it showing date (\d+\-\d+\-\d+)$/ do |number_of_events, date|  
  cal = Icalendar.parse(response.body).first
  cal.events.count.should == number_of_events.to_i
  
  cal.events.each do |event|
    event.start.to_date.should == Date.parse(date)
  end
end
