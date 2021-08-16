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
puts "📑 Seed bookings ..."

5.times do |i|
  user = User.new email: "test#{i}@email.com", password: '123456', password_confirmation: '123456'
  user.save
  puts user
  if i.even?
    chef_profile = ChefProfile.new user: user, years_exp: i
    chef_profile.save
    puts chef_profile
    3.times do |j|
      course = Course.new name: "#{Faker::Restaurant.type} #{Faker::Food.dish}", description: Faker::Restaurant.description,
                          cuisine_type: rand(5), chef_profile: chef_profile, duration: rand(1..3) * 3600000,
                          price: rand(3..5) * 1000
      course.save
      puts course
      if rand(2).even?
        booking = Booking.new course: course, user: user, date: Date.today + rand(5),
                              time_slot: rand(1..3), status: rand(0..3)
        booking.save
        puts booking
      end
    end
  end
end

puts "🌲 Seed complete ... #{User.count} Users / #{ChefProfile.count} ChefProfiles / #{Course.count} Courses / #{Booking.count} Bookings"
