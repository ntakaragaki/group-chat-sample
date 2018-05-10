# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(login_id: "testuser1", password: "foobar")
Group.create!()
Member.create!(user_id:1, group_id:1)
Chat.create!(text:"あのイーハトーヴォの透き通ったアレ", user_id:1, group_id:1, date:"1999/12/31")