class ItemsController < ApplicationController
  def index
    if params[:query].present?
    @items = Item.where(
      "name LIKE :term OR description LIKE :term",
      term: "%#{params[:query]}%"
    ).page(params[:page]).per(5)

    if params[:limit_to_franchise] == "1" && params[:set].present?
      @items = @items.where(franchise: params[:set]).where("name LIKE :term OR description LIKE :term",
      term: "%#{params[:query]}%").page(params[:page]).per(5)
    end

  elsif params[:franchise].present?
    @items = Item.where(franchise: params[:franchise]).page(params[:page]).per(5)

  else
    @items = Item.all.page(params[:page]).per(5)
  end

  @franchises = Item.distinct.pluck(:franchise)
  end

  def show
    @item = Item.find(params[:id])
  end

  def add_to_cart
    session[:cart] = {} unless session[:cart].is_a?(Hash)

  item_id = params[:item_id].to_s

  session[:cart][item_id] ||= 0
  session[:cart][item_id] += 1

  redirect_back(fallback_location: items_path)
  end

  def cart
    @cart = session[:cart] || {}

    @items = Item.where(id: @cart.keys)
  end

  def increase_quantity
    item_id = params[:item_id].to_s

    if session[:cart]&.key?(item_id)
      session[:cart][item_id] += 1
    end

    redirect_to cart_path
  end
  def decrease_quantity
    item_id = params[:item_id].to_s

    if session[:cart]&.key?(item_id)
      session[:cart][item_id] -= 1

      session[:cart].delete(item_id) if session[:cart][item_id] <= 0
    end

    redirect_to cart_path
  end
  def remove_from_cart
    session[:cart]&.delete(params[:item_id].to_s)

    redirect_to cart_path
  end
end
