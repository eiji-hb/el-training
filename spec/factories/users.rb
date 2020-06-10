FactoryBot.define do
  factory :user do
    name { "hoge" }
    email { "hoge@hoge.com" }
    password {"password"}
    password_confirmation {"password"}
    admin {"admin"}
  end
  factory :user1, class: User do
    name { "hoge1" }
    email { "hoge1@hoge.com" }
    password {"password1"}
    password_confirmation {"password1"}
    admin {"admin"}
  end
  factory :user2, class: User do
    name { "hoge2" }
    email { "hoge2@hoge.com" }
    password {"password12"}
    password_confirmation {"password12"}
    admin {"general"}
  end
  factory :user3, class: User do
    name { "hoge3" }
    email { "hoge3@hoge.com" }
    password {"password123"}
    password_confirmation {"password123"}
    admin {"general"}
  end

end
