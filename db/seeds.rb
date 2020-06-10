#User
User.create!(
  name: "テストユーザー",
  email: "test@example.com",
  password: "password",
  password_confirmation: "password",
  admin: "admin"
)
User.create!(
  name: "テストユーザー1",
  email: "test1@example.com",
  password: "password",
  password_confirmation: "password",
  admin: "general"
)
User.create!(
  name: "テストユーザー2",
  email: "test2@example.com",
  password: "password",
  password_confirmation: "password",
  admin: "general"
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

#Taglist
Taglist.create!(
  tag_name: "aaa"
)
Taglist.create!(
  tag_name: "bbb"
)
Taglist.create!(
  tag_name: "ccc"
)

#TagTable
tag1 = Taglist.first
tag2 = Taglist.find(2)
tag3 = Taglist.find(3)

tasks = Task.pluck(:id)
tasks[0..3].each do |id|
  task = Task.find(id)
  @tag_table = TagTable.create(taglist_id: tag1.id, task_id: task.id)
  @tag_table = TagTable.create(taglist_id: tag2.id, task_id: task.id)
end
tasks[4..6].each do |id|
  task = Task.find(id)
  @tag_table = TagTable.create(taglist_id: tag1.id, task_id: task.id)
  @tag_table = TagTable.create(taglist_id: tag2.id, task_id: task.id)
  @tag_table = TagTable.create(taglist_id: tag3.id, task_id: task.id)
end
tasks[7..9].each do |id|
  task = Task.find(id)
  @tag_table = TagTable.create(taglist_id: tag2.id, task_id: task.id)
  @tag_table = TagTable.create(taglist_id: tag3.id, task_id: task.id)
end