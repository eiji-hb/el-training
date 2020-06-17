FactoryBot.define do
  factory :notification do
    # association :task
    # association :user
    action { "expired" }
    checked { false }
    user { nil }
    task { nil }
  end
end
