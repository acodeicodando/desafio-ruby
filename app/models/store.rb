class Store
  include Mongoid::Document
  field :name, type: String
  field :website, type: String
  field :api, type: String
  field :logo, type: String
  field :email, type: String
  has_many :products

  validates :name, :website, :api, :logo, :email, presence: :true
  validates :name, :email, :api,                  uniqueness: true
end
