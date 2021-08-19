# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CUISINES = %w[chinese italian japanese french belgian american indian ethiopian cuban indonesian filipino]

puts "🔫 Destroy everything ..."
User.destroy_all
ChefProfile.destroy_all
Course.destroy_all
Booking.destroy_all

puts "🧑 Seed hardcoded users ..."
puts "🔪 Seed chef_profiles ..."
puts "🍝 Seed courses ..."

USERNAMES = %w[Ryan Eric Nicole Sarah Beth]
USERNAMES.each_with_index do |name, i|
  user = User.new email: "#{name}@imhungry.com", password: '123456', password_confirmation: '123456'
  user.save!

  next unless i.even?

  chef_profile = ChefProfile.new user: user, years_exp: i + rand(1..5)
  chef_profile.save!
end

users = User.all

course = Course.new name: "Traditional Kaiseki Seafood Course",
                    description: "A 5-course meal featuring locally sourced ingredients
                    and highlighting a progression of light to rich flavors.",
                    cuisine_type: "Japanese",
                    chef_profile: users[0].chef_profile, duration: 3 * 3_600_000,
                    price: 7500,
                    image_url: "https://images.unsplash.com/photo-1548285181-3103ce5d3db2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1834&q=80"
course.save!

course = Course.new name: "Hearty Raclette Course",
                    description: "Enjoy this Swiss favorite as you indulge in
                    a variety of vegetables and meat covered with melted cheese.",
                    cuisine_type: "Swiss",
                    chef_profile: users[2].chef_profile, duration: 3_600_000,
                    price: 3500,
                    image_url: "https://images.unsplash.com/photo-1582883044880-974679bc1f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"
course.save!

course = Course.new name: "Japanese Soul Food Course",
                    description: "Get your comfort-food on with this 'junky' course
                    featuring ramen, okonomiyaki, and yakitori.",
                    cuisine_type: "Japanese",
                    chef_profile: users[2].chef_profile, duration: 2 * 3_600_000,
                    price: 3500,
                    image_url: "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1876&q=80"
course.save!

course = Course.new name: "Southern Fried Chicken Course",
                    description: "Some heavy fried goodness with this course,
                    two full birds and a smattering of sides.",
                    cuisine_type: "American",
                    chef_profile: users[4].chef_profile, duration: 3_600_000,
                    price: 4000,
                    image_url: "https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"
course.save!

course = Course.new name: "French Prix Fixe Course",
                    description: "Dress up and sit down for this upscale dining
                    experience featuring 4 delicate courses and dessert.",
                    cuisine_type: "French",
                    chef_profile: users[4].chef_profile, duration: 3 * 3_600_000,
                    price: 8500,
                    image_url: "https://images.unsplash.com/photo-1600663791817-d74f5196ba29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80"
course.save!

puts "📑 Seed bookings ..."
all_user = User.all
all_chef = ChefProfile.all
30.times do
  user = all_user.sample
  chef = all_chef.sample
  chef = all_chef.sample while user == chef.user
  course = chef.courses.sample
  booking = Booking.new course: course, user: user, date: Date.today + rand(10),
                        time_slot: rand(1..2), status: rand(0..2)
  booking.save!
end

puts "🧑 Seed users ..."
puts "🔪 Seed chef_profiles ..."
puts "🍝 Seed courses ..."

10.times do |i|
  user = User.new email: "test#{i}@email.com", password: '123456', password_confirmation: '123456'
  user.save!
  next unless i.even?

  chef_profile = ChefProfile.new user: user, years_exp: i
  chef_profile.save!
  rand(4..6).times do
    course = Course.new name: "#{Faker::Food.dish} course",
                        description: Faker::Food.description, cuisine_type: CUISINES.sample,
                        chef_profile: chef_profile, duration: rand(1..3) * 3_600_000,
                        price: rand(1..5) * 1500
    course.save!
  end
end

puts "📑 Seed bookings ..."
all_user = User.all
all_chef = ChefProfile.all
30.times do
  user = all_user.sample
  chef = all_chef.sample
  chef = all_chef.sample while user == chef.user
  course = chef.courses.sample
  booking = Booking.new course: course, user: user, date: Date.today + rand(10),
                        time_slot: rand(1..2), status: rand(0..2)
  booking.save!
end

puts "🌲 Seed complete ... #{User.count} Users / #{ChefProfile.count} ChefProfiles / #{Course.count} Courses / #{Booking.count} Bookings"
