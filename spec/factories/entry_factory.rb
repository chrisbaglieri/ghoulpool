Factory.define :entry do |entry|
  entry.association :owner, :factory => :user
  entry.association :ghoul, :factory => :living_ghoul
  entry.association :pool
end