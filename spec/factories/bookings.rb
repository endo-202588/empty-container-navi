FactoryBot.define do
  factory :booking do
    association :voyage
    association :user
    container_type { 1 }
    quantity { 1 }
    cargo_name { "one" }
    cargo_detail { "foods" }
  end
end
