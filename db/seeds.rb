# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "🔫 Destroy everything ..."
User.destroy_all
Chef_profile.destroy_all
Course.destroy_all
Booking.destroy_all

puts "🧑 Seed users ..."
puts "👨‍🍳 Seed chef_profiles ..."
puts "🍝 Seed courses ..."
puts "📑 Seed bookings ..."

5.times do |i|
  user = User.new :name => Faker::Name.name, :email => "test#{i}@email.com", :password => '123456', :password_confirmation => '123456'
  user.save
  puts user
  if i.even?
    chef_profile = Chef_profile.new :user => user, :years_exp => i
    chef_profile.save
    puts chef_profile
    3.times do |j|
      course = Course.new :name => "#{Faker::Restaurant.type} #{Faker::Food.dish}", :description => Faker::Restaurant.description,
                          :cuisine_type => rand(5), chef_profile: => chef_profile, duration: => (1..3).sample * 3600000,
                          price: (3..5).sample * 1000
      course.save
      puts course
      if rand(2).even?
        booking = Booking.new :course => course, :user => user, :date => Date.today + rand(5),
                              :time_slot => (1..3).sample, :status:time_slot => (0..3).sample
        booking.save
        puts booking
      end
    end
  end
end

puts "🌲 Seed complete ..."
