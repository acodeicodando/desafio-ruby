class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short
  include Mongoid::Timestamps::Updated::Short

  field :name, type: String
  field :image, type: String
  field :url, type: String
  
  belongs_to :store
  has_many :payment_systems, autosave: true
  has_one :last_payment,
    class_name: 'PaymentSystem', foreign_key: :product_id

  validates :name, :image, :url, :store, presence: true
end
