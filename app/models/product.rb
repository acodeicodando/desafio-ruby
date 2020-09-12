class Product
  include Mongoid::Document
  field :name, type: String
  field :image, type: String
  field :url, type: String
  belongs_to :store
  has_many :payment_systems, autosave: true

  validates :name, :image, :url, :store, presence: true
end
