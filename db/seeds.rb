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

USERNAMES = %w[Ryan Tim Alex Eric Robert Nicole Corinne Sarah Courtney]
USERNAMES.each_with_index do |name, i|
  user = User.new email: "#{name}@imhungry.com", password: '123456', password_confirmation: '123456'
  user.save!

  next unless i.even?

  chef_profile = ChefProfile.new user: user, years_exp: i + rand(1..5)
  chef_profile.save!
end

course = Course.new name: "#{Faker::Food.dish} course",
                    description: Faker::Food.description, cuisine_type: CUISINES.sample,
                    chef_profile: chef_profile, duration: rand(1..3) * 3_600_000,
                    price: rand(1..5) * 1500
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
