FactoryBot.define do
  
  factory :user do
    name { "junichi" }
    email { "example@test.com" }

    factory :user_no_name do
      name { nil }
    end

    factory :user_no_email do
      email { nil }
    end
  
    factory :user_dup_email do
      name { "mike" }
    end

  end
end
