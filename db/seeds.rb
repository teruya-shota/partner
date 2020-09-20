# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 顧客データを自動生成
20.times do |n|
  gimei = Gimei.new

  User.create(
    name: gimei.name.romaji,
    email: Faker::Internet.email,
    is_valid: Faker::Boolean.boolean,       #boolean
    password: Faker::Number.number(digits: 6),
  )
end

#管理者作成
Admin.create!(
   email: 't@t',
   password: 'zaq',
)

