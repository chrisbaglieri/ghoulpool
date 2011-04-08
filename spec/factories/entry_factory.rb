Factory.define :entry do |entry|
  entry.points 0
  entry.association :user
  entry.association :ghoul
  entry.association :pool
end