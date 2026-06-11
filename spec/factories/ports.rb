FactoryBot.define do
  factory :port do
    sequence(:name) { |n| "港#{n}" }

    country { "JP" }

    map_x { 50.0 }
    map_y { 50.0 }
  end
end
