Factory.define :ghoul do |ghoul|
  ghoul.name (0...8).map{65.+(rand(25)).chr}.join
  ghoul.born_on Date.new(2000, 12, 31)
  ghoul.died_on DateTime.now
  ghoul.freebase_id  (0...8).map{65.+(rand(25)).chr}.join
end