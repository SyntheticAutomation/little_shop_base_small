class ReviewsController < ApplicationController

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

  private

  def review_params
    params.require(:review).permit(:title, :description, :item_id, :rating)
  end

end
