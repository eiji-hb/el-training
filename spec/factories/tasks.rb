FactoryBot.define do
  factory :task, class: Task do
    name { 'MyText' }
    description { 'MyTextMyTextMyTextMyTextMyText' }
    deadline {'2000-07-15 18:25:00'}
    status {"未着手"}
    priority { 3 }
    user { nil }
    # association :user
  end
  factory :task1, class: Task do
    name { '1MyText' }
    description { '1MyTextMyTextMyTextMyTextMyText' }
    deadline {'2021-07-15 18:25:00'}
    status {"完了"}
    priority { 2 }
    association :user,factory: :user1
  end
  factory :task2, class: Task do
    name { '2MyText' }
    description { '2MyTextMyTextMyTextMyTextMyText' }
    deadline {'2022-07-15 18:25:00'}
    status {"着手中"}
    priority { 1 }
    association :user,factory: :user2
  end
  factory :task3, class: Task do
    name { '3MyText' }
    description { '3MyTextMyTextMyTextMyTextMyText' }
    deadline {'2023-07-15 18:25:00'}
    status {"未着手"}
    priority { 1 }
    association :user,factory: :user3

  end
end