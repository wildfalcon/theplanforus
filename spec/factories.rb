Factory.define :week do |w|
  w.date Date.parse("2010-01-01")
end

Factory.define :event do |e|
  e.kind "major"
  e.name "Blackpool"
  e.date Date.parse("2010-05-27")
end