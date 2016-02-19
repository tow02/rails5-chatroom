# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'paween.the@gmail.com',
                    password: '12345678',
                    password_confirmation: '12345678')
user1.save!

user2 = User.create(email: 'torpong.boss@gmail.com',
                    password: '12345678',
                    password_confirmation: '12345678')
user2.save!
