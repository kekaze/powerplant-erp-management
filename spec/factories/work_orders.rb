FactoryBot.define do
  factory :work_order do
    wor_number { 1 }
    equipment { nil }
    priority { "MyString" }
    description { "MyString" }
    status { "MyString" }
    inspected_at { "2024-04-17 00:01:16" }
    requestor { nil }
    reviewed_at { "2024-04-17 00:01:16" }
    reviewer { nil }
    approved_at { "2024-04-17 00:01:16" }
    approver { nil }
    closed_at { "2024-04-17 00:01:16" }
    closer { nil }
  end
end
