task :cron => :environment do
  Rake::Task['ghouls:sync'].invoke
  Pool.all.each { |pool| Rake::Task['rankings:refresh'].invoke(pool) }
  Ghoul.recent(Date.yesterday).each { |ghoul| ghoul.deliver_change_notifications }
end