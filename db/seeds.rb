# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "tOw02",
                    email: 'paween.the@gmail.com',
                    password: '12345678',
                    password_confirmation: '12345678')
user1.save!

user2 = User.create(username: "bossy",
                    email: 'torpong.boss@gmail.com',
                    password: '12345678',
                    password_confirmation: '12345678')
user2.save!

(1..5).each do |i|
  room = Room.create(name: i.to_s, user_id: 1)
  room.save!
end
