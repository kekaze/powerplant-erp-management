FactoryBot.define do
  factory :user do
    last_name { "MyString" }
    first_name { "MyString" }
    department_id { 1 }
    role_id { 1 }
    email { "MyString" }
    password_digest { "MyString" }
  end
end
