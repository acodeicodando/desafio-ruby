class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short
  include Mongoid::Timestamps::Updated::Short

  field :name, type: String
  field :image, type: String
  field :url, type: String
  
  belongs_to :store
  has_many :payment_systems, autosave: true

  validates :name, :image, :url, :store, presence: true

  def last_payment
    payment_systems.order_by(created_at: :desc).first
  end
end
