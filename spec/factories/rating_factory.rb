Factory.sequence :score do |score|
  score
end

Factory.define :ranking do |ranking|
  ranking.association :user
  ranking.association :pool
  ranking.score { Factory.next :score }
end