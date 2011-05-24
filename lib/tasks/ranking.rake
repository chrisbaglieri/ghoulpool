namespace :rankings do
  desc "Refreshes a pool's rankings"
  task :refresh, :pool, :needs => :environment do |t, args|
    pool = args[:pool]
    pool.rankings.each { |ranking| ranking.destroy }
    pool.users.each do |user|
      ranking = Ranking.new
      ranking.pool = pool
      ranking.user = user
      ranking.score = 0
      pool.user_entries(user).each do |entry|
        ranking.score += entry.value
      end
      ranking.save
    end
  end
end