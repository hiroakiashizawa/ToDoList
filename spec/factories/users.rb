FactoryBot.define do
  
  factory :user do
    id { 100 }
    name { "junichi" }
    email { "example@test.com" }
    password { "password" }
    password_confirmation { "password" }
    admin { "false" }

    factory :user2 do
      id { 101 }
      name { "kato" }
      email { "example-2@test.com" }   
    end
    
    factory :user_admin do
      id { 102 }
      name { "admin" }
      email { "admin@test.com" }
      admin { "true" }
    end

    factory :guest do
      id { 103 }
      name { "guest" }
      email { "guest@test.com" }
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

    factory :user_anti_dup_email do
      id { 99 }
      name { "john" }
      email { "john@test.com" }
      password { "password" }
      password_confirmation { "password" }
      admin { "false" }
      initialize_with { User.find_or_create_by(id: 99) }
    end

    factory :user_as_guest do
      email { "guest@todo.com" }
    end

  end
end
