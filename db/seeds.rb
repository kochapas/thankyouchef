require "open-uri"

CUISINES = %w[chinese italian japanese french belgian american indian ethiopian cuban indonesian filipino]

puts "🔫 Destroy everything ..."
User.destroy_all
ChefProfile.destroy_all
Course.destroy_all
Booking.destroy_all

puts "🧑 Seed hardcoded users ..."
puts "🔪 Seed hardcoded chef_profiles ..."
puts "🍝 Seed hardcoded courses ..."

# even indexed people are chefs [Ryan, Nicole, Beth]
USERNAMES = %w[Ryan Eric Nicole Kyle Allen]
FIRST_NAMES = ["Ryan", "Eric", "Nicole", "Kyle", "Allen"]
LAST_NAMES = ["Fergus", "Shipard", "Welks", "Barnes", "West"]
ADDRESS = ["Shibuya", "Shinjuku", "Ginza", "Omotesando", "Odaiba", "Akihabara", "Asakusa",
                  "Harajuku", "Shimbashi", "Ikebukuro", "Shimokitazawa", "Marunouchi", "Gaienmae",
                  "Ebisu", "Yoyogi", "Kichijoji", "Ueno", "Koenji", "Yurakucho", "Nakameguro", "Kasumigaseki",
                  "Nagatacho", "Shinagawa", "Akasaka-Mitsuke", "Meguro", "Shiodome", "Jimbocho", "Takebashi",
                  "Sugamo", "Hibiya", "Jiyugaoka", "Kyobashi", "Toranomon", "Aoyama Itchome", "Daikanyama",
                  "Fukagawa", "Denenchofu", "Hiroo", "Kagurazaka", "Futako Tama", "Sangenjaya", "Tsukiji",
                  "Gotanda", "Ochanomizu", "Nippori", "Nakano", "Takadanobaba"]
CITY = "Tokyo"

USERNAMES.each_with_index do |name, i|
  user = User.new email: "#{name}@imhungry.com",
                  password: '123456',
                  password_confirmation: '123456',
                  first_name: FIRST_NAMES[i],
                  last_name: LAST_NAMES[i],
                  city: CITY,
                  address: ADDRESS.sample
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
                    rating: 4.9
course.save!

course = Course.new name: "Hearty Raclette Course",
                    description: "Enjoy this Swiss favorite as you indulge in
a variety of vegetables and meat covered with melted cheese.",
                    cuisine_type: "Swiss",
                    chef_profile: users[2].chef_profile, duration: 3_600_000,
                    price: 3500,
                    rating: 4.5
course.save!

course = Course.new name: "Japanese Soul Food Course",
                    description: "Get your comfort-food on with this 'junky' course
                    featuring ramen, okonomiyaki, and yakitori.",
                    cuisine_type: "Japanese",
                    chef_profile: users[2].chef_profile, duration: 2 * 3_600_000,
                    price: 3500,
                    rating: 4.3
course.save!

course = Course.new name: "Southern Fried Chicken Course",
                    description: "Some heavy fried goodness with this course,
                    two full birds and a smattering of sides.",
                    cuisine_type: "American",
                    chef_profile: users[4].chef_profile, duration: 3_600_000,
                    price: 4000,
                    rating: 4.6
course.save!

course = Course.new name: "French Prix Fixe Course",
                    description: "Dress up and sit down for this upscale dining
                    experience featuring 4 delicate courses and dessert.",
                    cuisine_type: "French",
                    chef_profile: users[4].chef_profile, duration: 3 * 3_600_000,
                    price: 8500,
                    rating: 4.7
course.save!

course = Course.new name: "Grand Breakfast Course",
                    description: "Embrace the morning food coma with french toast,
                    eggs, and tasty meats.",
                    cuisine_type: "American",
                    chef_profile: users[0].chef_profile, duration: 3_600_000,
                    price: 2500,
                    rating: 4.5
course.save!

course = Course.new name: "Lazy Brunch Course",
                    description: "Take some time to indulge in this slow brunch
                    course featuring smoked salmon, poached eggs, and caviar.",
                    cuisine_type: "American",
                    chef_profile: users[0].chef_profile, duration: 2 * 3_600_000,
                    price: 3500,
                    rating: 4.7
course.save!

course = Course.new name: "Classic Italian Course",
                    description: "Pizza, pasta, panna cotta--what isn't to love
                    in this love letter course to classic Italian cuisine?",
                    cuisine_type: "Italian",
                    chef_profile: users[2].chef_profile, duration: 2 * 3_600_000,
                    price: 5500,
                    rating: 4.4
course.save!

course = Course.new name: "Fine Dining Course",
                    description: "Set aside some time to dine under candlelight
                    with this elegant and romantic course.",
                    cuisine_type: "French",
                    chef_profile: users[4].chef_profile, duration: 3 * 3_600_000,
                    price: 9000,
                    rating: 4.9
course.save!

course = Course.new name: "American Steak Course",
                    description: "Make your blood a little redder with this meaty
                    course featuring high-quality steaks and side dishes.",
                    cuisine_type: "American",
                    chef_profile: users[4].chef_profile, duration: 2 * 3_600_000,
                    price: 6000,
                    rating: 4.7
course.save!

course = Course.new name: "Dainty Dim Sum Course",
                    description: "Enjoy a variety of Dim Sum and other Chinese dishes
                    without the need to fight over the food cart.",
                    cuisine_type: "Chinese",
                    chef_profile: users[0].chef_profile, duration: 2 * 3_600_000,
                    price: 4000,
                    rating: 4.6
course.save!

course = Course.new name: "Spanish Paella Course",
                    description: "The wait is worth it with this course overflowing
                    with seafood, spices, and sides.",
                    cuisine_type: "Spanish",
                    chef_profile: users[2].chef_profile, duration: 3 * 3_600_000,
                    price: 5500,
                    rating: 4.6
course.save!

course = Course.new name: "All-Hands Boodle Course",
                    description: "Get your hands dirty with this traditional
                    Filipino meal serving everything from meats to fruits and rice.",
                    cuisine_type: "Filipino",
                    chef_profile: users[4].chef_profile, duration: 2 * 3_600_000,
                    price: 4000,
                    rating: 4.6
course.save!

course = Course.new name: "Yakitori Skewer Course",
                    description: "Charcoal grilled meats and veggies in your own
                    home--don't get stuck devouring these too quickly",
                    cuisine_type: "Japanese",
                    chef_profile: users[0].chef_profile, duration: 3_600_000,
                    price: 2500,
                    rating: 4.5
course.save!

course = Course.new name: "Golden Peking Duck Course",
                    description: "Nothing quite tops a few roast ducks, hoisin sauce,
                    and a tower of rice paper wraps served in your own home.",
                    cuisine_type: "Chinese",
                    chef_profile: users[0].chef_profile, duration: 2 * 3_600_000,
                    price: 7500,
                    rating: 4.8
course.save!


URLS = ["https://images.unsplash.com/photo-1548285181-3103ce5d3db2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1834&q=80",
        "https://images.unsplash.com/photo-1582883044880-974679bc1f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
        "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1876&q=80",
        "https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
        "https://images.unsplash.com/photo-1600663791817-d74f5196ba29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80",
        "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1547&q=80",
        "https://images.unsplash.com/photo-1605333396915-47ed6b68a00e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3300&q=80",
        "https://images.unsplash.com/photo-1593253787226-567eda4ad32d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3334&q=80",
        "https://images.unsplash.com/photo-1621494268492-d01b98eba7e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3334&q=80",
        "https://images.unsplash.com/photo-1600891964092-4316c288032e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3300&q=80",
        "https://images.unsplash.com/photo-1595424265370-3e02d3e6c10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3326&q=80",
        "https://images.unsplash.com/photo-1602755088318-39b7a7e6482a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3289&q=80",
        "https://images.unsplash.com/photo-1572776082973-1cb8d1790872?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1971&q=80",
        "https://images.unsplash.com/photo-1528909760809-0251be5d2111?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2048&q=80",
        "https://images.unsplash.com/photo-1592915890261-c96701c071f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"]

Course.all.each_with_index do |c, i|
  file = URI.open(URLS[i])
  c.photo.attach(io: file, filename: "#{c.name.split.join('-')}.png", content_type: 'image/png')
end

puts "📑 Seed bookings ..."
all_user = User.all
all_chef = ChefProfile.all
30.times do
  user = all_user.sample
  chef = all_chef.sample
  chef = all_chef.sample while user == chef.user
  course = chef.courses.sample
  booking = Booking.new course: course, user: user, date: Date.today + rand(1..10),
                        time_slot: rand(1..2), status: rand(0..2)
  booking.save!
end

puts "🧑 Seed fake users ..."
puts "🔪 Seed fake chef_profiles ..."
# puts " Seed fake courses ..."hardcoded

5.times do |i|
  user = User.new email: "test#{i}@email.com", password: '123456',
                  password_confirmation: '123456', first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  city: CITY,
                  address: ADDRESS.sample
  user.save!
  next unless i.even?

  chef_profile = ChefProfile.new user: user, years_exp: i
  chef_profile.save!
  # rand(1..3).times do
  #   course = Course.new name: "#{Faker::Food.dish} course",
  #                       description: Faker::Food.description, cuisine_type: CUISINES.sample,
  #                       chef_profile: chef_profile, duration: rand(1..3) * 3_600_000,
  #                       price: rand(1..5) * 1500,
  #                       rating: rand(3.0..4.0).round(2)
  #   course.save!
  # end
end

puts "📑 Seed bookings ..."
all_user = User.all
all_chef = ChefProfile.all
15.times do
  user = all_user.sample
  course = Course.all.sample while user == course.chef_profile.user
  booking = Booking.new course: course, user: user, date: Date.today + rand(10),
                        time_slot: rand(0..2), status: rand(0..2)
  booking.save!
end

User.all.each do |u|
  file = URI.open("https://thispersondoesnotexist.com/image")
  u.photo.attach(io: file, filename: "#{u.first_name}.png", content_type: 'image/png')
end

# Course.all[15..-1].each do |c|
#   file = URI.open("https://source.unsplash.com/800x500/?food-'#{c.name.split[-2]}'")
#   c.photo.attach(io: file, filename: "#{c.name.split[-2]}.png", content_type: 'image/png')
# end

puts "🌲 Seed complete ... #{User.count} Users / #{ChefProfile.count} ChefProfiles / #{Course.count} Courses / #{Booking.count} Bookings"
