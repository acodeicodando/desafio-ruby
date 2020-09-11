class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :devided_by, type: Integer
  field :image, type: String
  field :url, type: String
  belongs_to :store

  validates :name, :image, :url, :store,  presence: true
  validates :devided_by, :price,          numericality: { greater_than_or_equal_to: 0 }
end
