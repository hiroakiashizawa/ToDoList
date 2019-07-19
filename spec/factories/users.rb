FactoryBot.define do
  
  factory :user do
    id { 100 }
    name { "junichi" }
    email { "example@test.com" }
    password { "password" }
    password_confirmation { "password" }
    admin { "false" }

    factory :user_admin do
      id { 101 }
      name { "admin" }
      email { "admin@test.com" }
      password { "password" }
      password_confirmation { "password" }
      admin { "true" }
    end

    factory :user_no_name do
      name { nil }
    end

    factory :user_no_email do
      email { nil }
    end
  
    factory :user_dup_email do
      name { "mike" }
    end

    factory :user_as_guest do
      email { "guest@todo.com" }
    end

  end
end
