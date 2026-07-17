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
end
