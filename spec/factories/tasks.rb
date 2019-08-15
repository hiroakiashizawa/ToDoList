FactoryBot.define do

  factory :task do
    id { 1 }
    title { "title" }
    content { "content" }
    timelimit { DateTime.now }
    user_id { @user }
    completed { "false" }
    association :user

    factory :task_no_title do
      title { nil }
    end

    factory :task_no_content do
      content { nil }
    end
  end
end
