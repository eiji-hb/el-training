FactoryBot.define do
  factory :task, class: Task do
    name { 'MyText' }
    description { 'MyTextMyTextMyTextMyTextMyText' }
    deadline {'2020-07-15 18:25:00'}
    status {"未着手"}
  end
  factory :task1, class: Task do
    name { '1MyText' }
    description { '1MyTextMyTextMyTextMyTextMyText' }
    deadline {'2021-07-15 18:25:00'}
    status {"未着手"}
  end
  factory :task2, class: Task do
    name { '2MyText' }
    description { '2MyTextMyTextMyTextMyTextMyText' }
    deadline {'2022-07-15 18:25:00'}
    status {"未着手"}
  end
  factory :task3, class: Task do
    name { '3MyText' }
    description { '3MyTextMyTextMyTextMyTextMyText' }
    deadline {'2023-07-15 18:25:00'}
    status {"未着手"}
  end
end