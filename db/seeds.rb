# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'luke', password_digest: 'password')
User.create(username: 'tallal', password_digest: 'password')
Message.create(body: "hi", user_id: User.last.id)
Message.create(body: "hey", user_id: User.first.id)