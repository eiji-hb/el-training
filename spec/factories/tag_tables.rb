FactoryBot.define do
  factory :tag_table1,class: TagTable do
    taglist { nil }
    task { nil }
    # association :task
    # association :taglist,factory: :taglist1
  end
end
