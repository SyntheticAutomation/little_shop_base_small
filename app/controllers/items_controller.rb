class ItemsController < ApplicationController
  def index
    @items = Item.where(active: true)
    @popular_items = Item.popular_items(5)
    @unpopular_items = Item.unpopular_items(5)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Review.where(item: @item, visibility: true)
    @user = current_user
  end
end
