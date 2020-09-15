require 'faker'
FactoryBot.define do
  factory :store do
    products
    name      { Faker::Restaurant.name }
    website   { Faker::Internet.url }
    api       { Faker::Internet.url(host: 'example.com', path: '/api') }
    logo      { Faker::Internet.url(host: 'example.com', path: '/logo.png') }
    website   { Faker::Internet.email }
  end

  factory :product do
    store
    payment_systems
    name  { Faker::Computer.stack }
    image { Faker::Internet.url(host: 'example.com', path: '/image.png') }
    url   { Faker::Internet.url }
  end

  factory :payment_system do
    product
    value                   { 99.99 }
    list_value              { 99.99 }
    number_of_installments  { 12 }
    payment_system_name     { '12x sem juros' }
  end
end
