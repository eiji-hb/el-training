#User
User.create!(
  name: "テストユーザー",
  email: "test@example.com",
  password: "password",
  password_confirmation: "password",
  admin: "true"
)
User.create!(
  name: "テストユーザー1",
  email: "test1@example.com",
  password: "password",
  password_confirmation: "password",
)
User.create!(
  name: "テストユーザー2",
  email: "test2@example.com",
  password: "password",
  password_confirmation: "password",
)
#Task
user = User.first
3.times do |i|
  user.tasks.create!(
    name: "①テストタイトル #{i+1}",
    description: "①テスト投稿 #{i+1}",
    deadline: '2020-07-15 18:25:00',
    status: "未着手",
    priority: 3,
  )
end
3.times do |i|
  user.tasks.create!(
    name: "②テストタイトル #{i+1}",
    description: "②テスト投稿 #{i+1}",
    deadline: '2021-07-15 18:25:00',
    status: "完了",
    priority: 2,
  )
end
user2 = User.find(2)
3.times do |i|
  user2.tasks.create!(
    name: "③テストタイトル #{i+1}",
    description: "③テスト投稿 #{i+1}",
    deadline: '2023-07-15 18:25:00',
    status: "着手中",
    priority: 1,
  )
end