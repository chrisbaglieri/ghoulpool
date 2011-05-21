namespace :ghouls do
  desc "Syncs ghouls"
  task :sync => :environment do
    Ghoul.living.each do |ghoul|
      unless ghoul.alive?
        ghoul.sync
        ghoul.save
      end
    end
  end
end