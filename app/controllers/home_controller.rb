class HomeController < ApplicationController
  def index
    @products = Product.order_by(name: 'asc')
  end
end
