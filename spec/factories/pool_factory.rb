Factory.define :pool do |pool|
  pool.name 'Foo'
  pool.description  'Bar'
  pool.association :owner, :factory => :user
end