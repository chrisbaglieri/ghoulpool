Factory.define :entry do |entry|
  entry.points 0
  entry.association :owner, :factory => :user
  entry.association :ghoul
  entry.association :pool
end