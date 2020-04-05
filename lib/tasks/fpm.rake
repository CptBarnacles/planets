require 'faker'
require 'csv'
namespace :fpm do
  desc "TODO"
  task put_tables: :environment do

  	 Sponsor.destroy_all
     User.destroy_all
     Planet.destroy_all

     CSV.foreach("lib/assets/planets_file.csv", :headers =>true) do |row |
      puts row[2].inspect 

      #create new model from the csv 
      Planet.create!(
      loc_rowid: row[0].to_i,
      pl_name: row[2].to_s,
      pl_hostname: row[1].to_s,
      pl_orbital_period: row[4].to_f,
      pl_orbital_eccentricity: row[8].to_f,
      distance: row[17].to_f,
      pl_mass: row[25].to_f,
      pl_radius: row[29].to_f,
      discovery_telescope: row[33].to_s,
      number_of_moons: row[34].to_i,
      year_of_discovery: row[35].to_s,
      last_update: row[36].to_s
      )
    end

     p "Users removed"
        10.times do | index |
          User.create!(
           name: Faker::Name::name,
           email: Faker::Internet::email,
           password: "password",
           admin: false
           )     
        end
    
     p "Regular Users Added"
     User.create!(
      name: "admin",
      email: "admin@administrator.com",
      password: "password",
      admin: true
      )   
    p "Admin added"

    User.create!(
      name: "example",
      email: "example@example.com",
      password: "example123",
      admin: false
      )   
    p "Guest added"

     users = User.all
     planets = Planet.all

     50.times do |index|
       sponsor = Sponsor.new(
         first_name: Faker::Name::name,
         last_name: Faker::Name.last_name,
         planet_id: planets.sample.id,
         user_id: users.sample.id
        )
       sponsor.save
      end
     p "Sponsors generated"
  end
end
