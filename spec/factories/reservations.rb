FactoryBot.define do
  factory :reservation do
    wor_number { nil }
    reservation_number { 1 }
    issued_at { "2024-04-22 04:44:59" }
    status { "MyString" }
    total_cost { "9.99" }
  end
end
