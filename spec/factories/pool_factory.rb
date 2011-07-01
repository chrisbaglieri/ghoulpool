Factory.define :pool do |pool|
  pool.name 'Foo'
  pool.picks  10
  pool.association :owner, :factory => :user
  pool.association :rule
end