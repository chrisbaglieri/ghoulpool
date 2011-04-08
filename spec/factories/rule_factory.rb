Factory.define :rule do |rule|
  rule.function 'died_on - born_on'
  rule.association :pool
end