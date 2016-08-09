namespace :populate do
  desc "Populate movies in moviesearch"
  task movies: :environment do
    Movie.populate(60) do |movie|
      movie.title = Faker::Book.title.downcase
      movie.genre = Faker::Book.genre.downcase
      movie.actors = Faker::Name.name.downcase
      movie.user_id = Faker::Number.between(1, 10)

    end
    puts "60 movies have been created. Movie count is now #{Movie.count}."
  end

  desc "Populate Users in moviesearch"
  task users: :environment do

    User.populate(10) do |user|
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      # randomarray = (1..60).to_a.sample(7)
      # stringarray = randomarray.map(&:to_s)
      # user.likes = []
      # user.likes = stringarray

    end
    puts "10 users have been created. Uer count is now #{User.count}."
  end

end
