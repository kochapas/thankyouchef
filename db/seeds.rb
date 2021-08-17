# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "🔫 Destroy everything ..."
User.destroy_all
ChefProfile.destroy_all
Course.destroy_all
Booking.destroy_all

puts "🧑 Seed users ..."
puts "🔪 Seed chef_profiles ..."
puts "🍝 Seed courses ..."

10.times do |i|
  user = User.new email: "test#{i}@email.com", password: '123456', password_confirmation: '123456'
  user.save!
  if i.even?
    chef_profile = ChefProfile.new user: user, years_exp: i
    chef_profile.save!
    rand(4..6).times do |j|
      course = Course.new name: "#{Faker::Restaurant.type} #{Faker::Food.dish}", description: Faker::Restaurant.description,
      cuisine_type: rand(5), chef_profile: chef_profile, duration: rand(1..3) * 3600000,
      price: rand(3..5) * 1000
      course.save!
    end
  end
end

puts "📑 Seed bookings ..."
all_user = User.all
all_chef = ChefProfile.all
30.times do |i|
  user = all_user.sample
  chef = all_chef.sample
  while user == chef
    chef = all_chef.sample
  end
  course = chef.courses.sample
  booking = Booking.new course: course, user: user, date: Date.today + rand(10),
                        time_slot: rand(1..3), status: rand(0..3)
  booking.save!
end

puts "🌲 Seed complete ... #{User.count} Users / #{ChefProfile.count} ChefProfiles / #{Course.count} Courses / #{Booking.count} Bookings"
