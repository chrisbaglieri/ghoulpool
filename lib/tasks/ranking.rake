namespace :rankings do
  desc "Refreshes a pool's rankings"
  task :refresh, :pool, :needs => :environment do |t, args|
    pool = Pool.find(:pool)
    pool.rankings.each { |ranking| ranking.destroy }
    pool.users.each do |user|
      ranking = Ranking.new
      ranking.pool = pool
      ranking.user = user
      pool.user_entries(user).each do |entry|
        ranking.score += entry.value
      end
      ranking.save
    end
  end
end