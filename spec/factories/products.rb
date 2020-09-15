require 'faker'
FactoryBot.define do
  factory :product do
    store
    name  { Faker::Computer.stack }
    image { Faker::Internet.url(host: 'example.com', path: '/image.png') }
    url   { Faker::Internet.url }
    after(:create) do |creating_payment_systems|
      FactoryBot.create_list(:payment_system, 10, payment_systems: creating_payment_systems)
    end
  end
end
