FactoryBot.define do

  factory :task do
    title { "title" }
    content { "content" }
    association :user
  end
end
