namespace :db do
  
  desc "Fill database with sample data"

    task populate: :environment do
      make_users 
    end
end



def make_users
  #Creating Admin user
  admin = User.create!(name: "Simi Tresa Antony",
                       email: "simi.tresa.antony@gmail.com",
                       password: "secret",
                       password_confirmation: "secret")
  admin.toggle!(:admin)
  
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name, email: email, password: password,
                 password_confirmation: password)
  end
end
