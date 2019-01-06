class ItemsController < ApplicationController
  def index
    @items = Item.where(active: true)
    @popular_items = Item.popular_items(5)
    @unpopular_items = Item.unpopular_items(5)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Review.where(item: @item, visibility: true)
    @hidden_reviews = Review.where(item: @item, visibility: false)
    @user = current_user if current_admin?
    @avg_rating = @item.average_rating
  end
end
