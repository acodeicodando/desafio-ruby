require 'faker'
FactoryBot.define do
  factory :store do
    name      { Faker::Restaurant.name }
    website   { Faker::Internet.url }
    api       { Faker::Internet.url(host: 'example.com', path: '/api') }
    logo      { Faker::Internet.url(host: 'example.com', path: '/logo.png') }
    email     { Faker::Internet.email }
    after(:create) do |creating_products|
      FactoryBot.create_list(:products, 10, products: creating_products)
    end
  end
end
