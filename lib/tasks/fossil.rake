require 'faraday'
require 'json'
namespace :fossil do
  desc 'Collect Products'
  task :collect_products => :environment do
    store = Store.where(name: 'Fossil').first
    unless store.nil?
      begin
        response = Faraday.get(store.api)
        body = JSON.parse(response.body)
        body.each do |api_product|
          product = store.products.build(
            name: api_product["productName"],
            url: api_product["link"],
            image: api_product["items"].first["images"].first["imageUrl"]
          )
          api_product["items"].first["sellers"].first["commertialOffer"]["Installments"].each do |installment|
            product.payment_systems.build(
              list_value: installment["Value"],
              value: installment["TotalValuePlusInterestRate"],
              number_of_installments: installment["NumberOfInstallments"],
              payment_system_name: installment["PaymentSystemName"]
            )
          end
          product.save!
        end
      rescue => exception
        puts "Fossil Products API it's with problem"
        puts exception.message
      end
    end
  end
end