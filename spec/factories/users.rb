FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    company_name { "ONE" }
    first_name { "たろう" }
    last_name { "てすと" }
  end
end
