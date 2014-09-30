User.create(
  number: 35,
  display_name: "中橋　創太",
  birthday: DateTime.now - rand(40).year,
  description: "これは説明文です" * 200
)

User.create(
  number: 85,
  display_name: "小宮山　大樹",
  birthday: DateTime.now - rand(40).year,
  description: "これは説明文です" * 200
)

20.times do |n|
  User.create(
    number: n,
    display_name: "佐藤#{n}太郎",
    birthday: DateTime.now - rand(40).year,
    description: "これは説明文です" * 200
  )
end