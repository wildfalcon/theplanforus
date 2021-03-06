Factory.define :plan do |p|
  p.sequence(:name) {|n| "Plan_#{n}"}
  p.user {|user| user.association(:user)}
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

Factory.define :preparation do |p|
  p.date Date.parse("2010-05-27")
  p.start Time.now
  p.end   Time.now
  p.description "Albert Einstien"
  p.plan {|plan| plan.association(:plan)}
end

Factory.define :lesson do |p|
  p.date Date.parse("2010-05-27")
  p.start Time.now
  p.end   Time.now
  p.description "Albert Einstien"
  p.plan {|plan| plan.association(:plan)}
end


Factory.define :user do |u|
  u.sequence(:username) { |n| "foo#{n}" } 
  u.password "foobar"  
  u.password_confirmation { |usr| usr.password }  
  u.sequence(:email) {|n| "foo#{n}@example.com"}
  u.subscription_level {|user| user.association(:subscription_level)}
end

Factory.define(:subscription_level) do |s|
  s.name  "Level 1"
  s.allowed_plans 1
  s.timeline_limit 30
end

Factory.define(:lead) do |l|
  l.sequence(:email) {|n| "lead_#{n}@example.com"}
end