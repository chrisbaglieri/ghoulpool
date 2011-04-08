Factory.define :ghoul do |ghoul|
  ghoul.name 'Foo'
  ghoul.born_on Date.new(2000, 12, 31)
  ghoul.died_on DateTime.now
  ghoul.freebase_id  '/en/elizabeth_taylor'
end