namespace :db do

  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                  email: "example@example.com",
                  password: "foobar",
                  password_confirmation: "foobar")

    5.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end



  end

  desc "Fill database with sample data"
  task populate: :environment do

    users = User.all(limit: 2)
    3.times do
      title = Faker::Lorem.words(2)
      users.each { |user| user.projects.create!(title: title) }
    end
  end
end