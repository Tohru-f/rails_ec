# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
merchandise1 = Merchandise.create!(
  name: 'クロマグロ',
  amount: 10000,
  description: '16.7Kg, 105cm',
  stock: 1,
  how_to_cook: '何でもござれ'
)
merchandise1.image.attach(io: File.open(Rails.root.join("app/assets/images/BIG_TUNA.JPG")), filename: "BIG_TUNA.JPG")

merchandise2 = Merchandise.create!(
  name: 'マダイ',
  amount: 8000,
  description: '5.8Kg, 77cm',
  stock: 1,
  how_to_cook: '刺身、煮付け'
)
merchandise2.image.attach(io: File.open(Rails.root.join("app/assets/images/red_sea_bream.JPG")), filename: "red_sea_bream.JPG")

merchandise3 = Merchandise.create!(
  name: 'ヒラマサ',
  amount: 7500,
  description: '5.0Kg, 80cm',
  stock: 1,
  how_to_cook: '刺身、ヒラマサ大根'
)
merchandise3.image.attach(io: File.open(Rails.root.join("app/assets/images/yellowtail_kingfish2.jpg")), filename: "yellowtail_kingfish2.jpg")

merchandise4 = Merchandise.create!(
  name: 'ヒラマサ',
  amount: 7000,
  description: '4.5Kg, 78cm',
  stock: 1,
  how_to_cook: '刺身、ヒラマサ大根'
)
merchandise4.image.attach(io: File.open(Rails.root.join("app/assets/images/yellowtail_kingfish1.jpg")), filename: "yellowtail_kingfish1.jpg")

merchandise5 = Merchandise.create!(
  name: 'アカハタ',
  amount: 1000,
  description: '500g, 20cm',
  stock: 1,
  how_to_cook: '刺身、あら汁'
)
merchandise5.image.attach(io: File.open(Rails.root.join("app/assets/images/red_grouper.JPG")), filename: "red_grouper.JPG")

merchandise6 = Merchandise.create!(
  name: 'サワラ',
  amount: 1500,
  description: '800g, 40cm',
  stock: 1,
  how_to_cook: '刺身(炙り)'
)
merchandise6.image.attach(io: File.open(Rails.root.join("app/assets/images/spanish_mackerel.JPG")), filename: "spanish_mackerel.JPG")

merchandise7 = Merchandise.create!(
  name: 'ブリ',
  amount: 5000,
  description: '3.5Kg, 70cm',
  stock: 1,
  how_to_cook: '刺身、ぶり大根'
)
merchandise7.image.attach(io: File.open(Rails.root.join("app/assets/images/japanese_amberjack.JPG")), filename: "japanese_amberjack.JPG")
