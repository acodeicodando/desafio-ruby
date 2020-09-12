class PaymentSystem
  include Mongoid::Document
  field :value, type: Float
  field :list_value, type: Float
  field :number_of_installments, type: Integer
  field :payment_system_name, type: String
  belongs_to :product

  validates :number_of_installments, :value, :list_value, numericality: { greater_than_or_equal_to: 0 }
end
