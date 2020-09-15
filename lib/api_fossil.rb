require 'faraday'
require 'json'
module API
  class Fossil
    attr_accessor :store, :products
    def initialize
      @store = Store.where(name: 'Fossil').first
      @products = []
      unless @store.nil?
        begin
        response = Faraday.get(@store.api)
        @products = JSON.parse(response.body)
        rescue => exception
          puts "Fossil Products API it's with problem"
          puts exception.message
        end
      else
        puts "Fossil Store don't exists"
      end
    end
    
    def run
      @products.each do |api_product|
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
    end
  end
end