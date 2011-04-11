Factory.define :pool do |pool|
  pool.name 'Foo'
  pool.description  'Bar'
  pool.picks  10
  pool.association :owner, :factory => :user
end