FactoryBot.define do
  factory :project do
    id { 50 }
    project_name { "WaoWao" }
    user_id { @user }
    
    factory :project_2 do
      id { 2 }
    end

    factory :project_3 do
      id { 3 }
    end

    factory :project_params do
      project_name { "all" }
    end
  end
end
