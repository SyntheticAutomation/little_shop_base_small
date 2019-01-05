class ReviewsController < ApplicationController

  def index
    @reviews = Review.where(user: current_user)
  end

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.item = @item
    @review.user = current_user
    if @review.save
      flash[:notice] = "Your review was successfully posted."
      redirect_to item_path(@item)
    else
      flash[:notice] = unless @review.errors.messages[:email].empty?
        "There was a problem submitting your review. Please try again with valid information."
      end
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @item = @review.item
    @current_user = current_user
  end

  def edit
    @review = Review.find(params[:id])
    @item = @review.item
    @review.user = current_user
  end

  def update
    @review = Review.find(params[:id])
    @item = @review.item
    @review.user = current_user
    if @review.update(review_params)
      flash[:notice] = "Your review was successfully posted."
      redirect_to item_review_path(@item, @review)
    else
      flash[:notice] = unless @review.errors.messages[:email].empty?
        "There was a problem submitting your review. Please try again with valid information."
      end
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @item = @review.item
    @review.destroy
    flash[:success] = "The review was successfully deleted."
    redirect_to item_path(@item)
  end

  def enable
    flash[:notice] = "This review is now visible. To make it hidden, click the Disable button."
    set_visibility(true)
  end

  def disable
    flash[:notice] = "This review has been hidden. To make it visible again, click the Enable button."
    set_visibility(false)
  end

  private

  def set_visibility(value)
    review = Review.find(params[:id])
    item = review.item
    review.visibility = value
    review.save
    redirect_to item_review_path(item, review) unless current_user.admin?
    redirect_to item_path(item) if current_user.admin?
  end

  def review_params
    params.require(:review).permit(:title, :description, :item_id, :rating)
  end

end
