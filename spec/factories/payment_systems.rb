require 'faker'
FactoryBot.define do
  factory :payment_system do
    product
    value                   { 99.99 }
    list_value              { 99.99 }
    number_of_installments  { 12 }
    payment_system_name     { '12x sem juros' }
  end
end
