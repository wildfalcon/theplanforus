Factory.define :week do |w|
  w.date Date.parse("2010-01-01")
end

Factory.define :day do |d|
  d.date Date.parse("2010-01-01")
end

Factory.define :event do |e|
  e.primary true
  e.name "Blackpool"
  e.date Date.parse("2010-05-27")
end

Factory.define :lesson do |l|
  l.date Date.parse("2010-05-27")
  l.start Time.now
  l.end   Time.now
  l.teacher "Albert Einstien"
end

Factory.define :user do |u|
  u.sequence(:username) { |n| "foo#{n}" } 
  u.password "foobar"  
  u.password_confirmation { |usr| usr.password }  
  u.sequence(:email) {|n| "foo#{n}@example.com"}
end