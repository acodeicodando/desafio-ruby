class PaymentSystem
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short
  include Mongoid::Timestamps::Updated::Short
  field :value, type: Float
  field :list_value, type: Float
  field :number_of_installments, type: Integer
  field :payment_system_name, type: String
  belongs_to :product

  validates :number_of_installments, :value, :list_value, numericality: { greater_than_or_equal_to: 0 }

  def installment_value
    list_value.to_f / number_of_installments.to_i
  end
end
