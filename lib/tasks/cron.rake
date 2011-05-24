task :cron => :environment do
  Rake::Task['ghouls:sync'].invoke
  Pool.all.each { |pool| Rake::Task['rankings:refresh'].invoke(pool) }
end