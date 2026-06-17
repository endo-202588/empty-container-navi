FactoryBot.define do
  factory :booking do
    association :voyage
    association :user

    container_type { :reefer }
    quantity { 1 }
    cargo_name { "one" }
    cargo_detail { "foods" }

    after(:build) do |booking|
      create(
        :container_stock,
        port: booking.voyage.route.departure_port,
        carrier: booking.voyage.carrier,
        container_type: booking.container_type,
        quantity: 10
      )
    end
  end
end
