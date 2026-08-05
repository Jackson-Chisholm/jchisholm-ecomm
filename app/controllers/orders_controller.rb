class OrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new]
  def index
  end

  def new

    @order = Order.new
    @cart = session[:cart] || {}
    @items = Item.where(id: @cart.keys)
  end

  def create
  end
end
