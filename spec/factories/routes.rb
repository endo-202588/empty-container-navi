FactoryBot.define do
  factory :route do
    association :departure_port, factory: :port
    association :arrival_port, factory: :port
  end
end
