class CustomersController < ApplicationController
  def index
    @provinces = Province.all
  end

  def new
    @customer = Customer.new
    @provinces = Province.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      @provinces = Province.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :name,
      :email,
      :address,
      :province_id,
      :password,
      :password_confirmation
    )
  end
end
