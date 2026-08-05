class OrdersController < ApplicationController
  def index
  end

  def new
    before_action :authenticate_customer!

    @order = Order.new
    @cart = session[:cart] || {}
    @items = Item.where(id: @cart.keys)
  end

  def create
  end
end
