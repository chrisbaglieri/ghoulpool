task :cron => :environment do
  Rake::Task['ghouls:sync'].invoke
end