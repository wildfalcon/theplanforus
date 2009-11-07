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
  l.start Time.now
  l.end   Time.now
  l.teacher "Albert Einstien"
end