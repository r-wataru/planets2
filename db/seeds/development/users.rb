20.times do |n|
  User.create(
    number: rand(100),
    display_name: "佐藤#{n}太郎",
    screen_name: "sato#{n}",
    birthday: DateTime.now - rand(40).year,
    description: "これは説明文です" * 200
  )
end