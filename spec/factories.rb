Factory.define :plan do |p|
  p.sequence(:name) {|n| "Plan_#{n}"}
end

Factory.define :week do |w|
  w.date Date.parse("2010-01-01")
  w.plan {|plan| plan.association(:plan)}
end

Factory.define :day do |d|
  d.date Date.parse("2010-01-01")
  d.plan {|plan| plan.association(:plan)}
end

Factory.define :event do |e|
  e.primary true
  e.name "Blackpool"
  e.date Date.parse("2010-05-27")
  e.plan {|plan| plan.association(:plan)}
end

Factory.define :lesson do |l|
  l.date Date.parse("2010-05-27")
  l.start Time.now
  l.end   Time.now
  l.teacher "Albert Einstien"
  l.plan {|plan| plan.association(:plan)}
end

Factory.define :user do |u|
  u.sequence(:username) { |n| "foo#{n}" } 
  u.password "foobar"  
  u.password_confirmation { |usr| usr.password }  
  u.sequence(:email) {|n| "foo#{n}@example.com"}
end