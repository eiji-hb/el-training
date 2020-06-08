FactoryBot.define do
  factory :task, class: Task do
    name { 'MyText' }
    description { 'MyTextMyTextMyTextMyTextMyText' }
  end
  factory :task1, class: Task do
    name { '1MyText' }
    description { '1MyTextMyTextMyTextMyTextMyText' }
  end
  factory :task2, class: Task do
    name { '2MyText' }
    description { '2MyTextMyTextMyTextMyTextMyText' }
  end
  factory :task3, class: Task do
    name { '3MyText' }
    description { '3MyTextMyTextMyTextMyTextMyText' }
  end
end