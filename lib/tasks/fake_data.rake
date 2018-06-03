namespace :generate do

  desc "Rake job for generating fake data"

  task :fake_actors => :environment do
    10.times do |i|
      Thread.new do
        puts "Generating Actor - #{i}"
        Actor.create(
          uuid: SecureRandom.uuid,
          login: Faker::Name.name,
          avatar_url: "https://example.com/avatar/#{i}",
          events_count: rand(0..10000),
          last_event_at: Faker::Date.between(5.years.ago, Date.today),
          longest_streak: rand(0..15)
        )
      end
    end.each {|thread| thread.join}
  end

end
