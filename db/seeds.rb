# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# admins
adminOne = User.new(
  email: 'adminone@gmail.com',
  password: '123123',
  password_confirmation: '123123',
  balance: 0,
  role: true,
  verified: true
)
adminOne.skip_confirmation!
adminOne.save



# users
user_one = User.new(
  email: 'userone@gmail.com',
  password: '123123',
  password_confirmation: '123123',
  balance: 0,
  role: false,
  verified: false
)
user_one.skip_confirmation!
user_one.save

user_two = User.new(
  email: 'usertwo@gmail.com',
  password: '123123',
  password_confirmation: '123123',
  balance: 0,
  role: false,
  verified: true
)
user_two.skip_confirmation!
user_two.save

user_three = User.new(
  email: 'userthree@gmail.com',
  password: '123123',
  password_confirmation: '123123',
  balance: 0,
  role: false,
  verified: true
)
user_three.skip_confirmation!
user_three.save


user_four = User.new(
  email: 'userfour@gmail.com',
  password: '123123',
  password_confirmation: '123123',
  balance: 0,
  role: false,
  verified: false
)
user_four.skip_confirmation!
user_four.save
