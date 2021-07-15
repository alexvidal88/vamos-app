# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data = File.read('public/user_seeds.json')
new_users = JSON.parse(data)
new_users['users'].each do |new_user|
  created_user = User.new(
    fisrt_name: new_user['fisrt_name'],
    family_name: new_user['family_name'],
    username: new_user['username'],
    email: new_user['email'],
    user_id: user.id
  )

end

