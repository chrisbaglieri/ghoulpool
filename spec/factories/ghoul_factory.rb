Factory.define :ghoul do |ghoul|
end

Factory.define :living_ghoul, :parent => :ghoul do |ghoul|
  ghoul.name "Charlie Sheen"
  ghoul.born_on Date.new(1965, 9, 3)
  ghoul.freebase_id  "/en/charlie_sheen"
end

Factory.define :dead_ghoul, :parent => :ghoul do |ghoul|
  ghoul.name "Elizabeth Taylor"
  ghoul.born_on Date.new(1932, 2, 27)
  ghoul.freebase_id  "/en/elizabeth_taylor"
  ghoul.died_on Date.new(2011, 3, 23)
end