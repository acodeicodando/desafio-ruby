require 'faker'
FactoryBot.define do
  factory :payment_system do
    product
    value                   { 99.99 }
    list_value              { 99.99 }
    number_of_installments  { 10 }
    payment_system_name     { '10x sem juros' }
  end
end
