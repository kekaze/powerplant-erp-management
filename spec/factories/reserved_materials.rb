FactoryBot.define do
  factory :reserved_material do
    reservation { nil }
    material { nil }
    quantity { 1 }
    subtotal { "9.99" }
  end
end
