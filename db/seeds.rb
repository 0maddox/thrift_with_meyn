require 'faker'
puts "seeding"

# Create categories
categories = Category.create([
  { name: 'Pallazos' },
  { name: 'Rompers' },
  { name: 'Jumpsuits' },
  { name: 'Dresses' },
  { name: 'Skirts' },
])

# Create regular users
users = []
20.times do
  users << User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password', # Replace with your authentication system's password attribute
    role: 'regular',
    profile_picture: Faker::Avatar.image
  )
end

# Create admin users
admin_users = [
  {
    username: 'nick',
    email: 'nickkiim7@gmail.com',
    password: 'maddox@12',
    password_confirmation: 'maddox@12',
    role: 'admin',
    profile_picture: 'https://i.pinimg.com/236x/68/df/46/68df46300164ec512d95be4139bf9fe7.jpg'
  },
  {
    username: 'meyn',
    email: 'meynsfashion@gmail.com',
    password: 'Meyn@2222',
    password_confirmation: 'Meyn@2222',
    role: 'admin',
    profile_picture: 'https://i.pinimg.com/236x/2b/13/25/2b1325ae609a0eac4aa30f83259f0864.jpg'
  }
]

admin_users.each do |admin|
  User.create(admin)
end

# Create clothing items for each category
categories.each do |category|
  20.times do
    # Generate random user from regular users for associations
    random_user = users.sample

    clothing_item = category.clothing_items.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      size: Faker::App.name,
      color: Faker::Color.color_name,
      price: Faker::Commerce.price(range: 500.0..2000.0),
      picture: Faker::Internet.url,  # Use this to generate a placeholder image URL
    )

    # Create associated reservations, payments, etc.
    reservation = clothing_item.reservations.create(
      user: random_user,
      payment_status: ['pending', 'completed'].sample,
      reserved_amount: clothing_item.price / 2
    )

    payment = clothing_item.payments.create(
      user: random_user,
      payment_status: ['pending', 'completed'].sample,
      amount: clothing_item.price
    )

    rating = clothing_item.ratings.create(
      user: random_user,
      value: rand(1..10)
    )

    favorite = clothing_item.favorites.create(
      user: random_user
    )

    # Add more associations...
  end
end

puts "done seeding"