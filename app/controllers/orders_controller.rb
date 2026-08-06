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
    @order = Order.new(order_params)
    if @order.save
      session[:cart] = {}
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def order_params
      params.expect(order: [ :items, :order_total, :customer_id, :status ])
    end
end
