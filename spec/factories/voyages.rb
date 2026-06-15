FactoryBot.define do
  factory :voyage do
    association :route
    association :carrier
    departure_date { "2026-06-11" }
    dry_capacity { 1 }
    reefer_capacity { 1 }
  end
end
