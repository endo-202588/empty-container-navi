FactoryBot.define do
  factory :container_stock do
    association :port
    association :carrier

    container_type { :dry }
    quantity { 10 }
  end
end
