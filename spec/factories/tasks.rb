FactoryBot.define do

  factory :task do
    title { "title" }
    content { "content" }
    timelimit { DateTime.now }
    association :user

    factory :task_no_title do
      title { nil }
    end

    factory :task_no_content do
      content { nil }
    end
  end
end
