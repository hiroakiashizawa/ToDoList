FactoryBot.define do
  
  factory :user do
    id { 100 }
    name { "junichi" }
    email { "example@test.com" }
    password { "password" }
    password_confirmation { "password" }

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
