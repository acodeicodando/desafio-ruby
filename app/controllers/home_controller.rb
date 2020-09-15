class HomeController < ApplicationController
  def index
    query = params[:q].blank? ? '*' : params[:q]
    @products = Product.search query, page: params[:page], per_page: 4, order: {name: 'asc'}
  end
end
