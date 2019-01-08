class MerchantsController < ApplicationController
  before_action :require_merchant, only: :show

  def index
    flags = {role: :merchant}
    unless current_admin?
      flags[:active] = true
    end
    @merchants = User.where(flags)

    @top_3_revenue_merchants = User.top_3_revenue_merchants
    @top_3_fulfilling_merchants = User.top_3_fulfilling_merchants
    @bottom_3_fulfilling_merchants = User.bottom_3_fulfilling_merchants
    @top_3_states = Order.top_3_states
    @top_3_cities = Order.top_3_cities
    @top_3_quantity_orders = Order.top_3_quantity_orders
  end

  def show
    @merchant = current_user
    @orders = @merchant.my_pending_orders
    @top_5_items = @merchant.top_items_by_quantity(5)
    @qsp = @merchant.quantity_sold_percentage
    @top_3_states = @merchant.top_3_states
    @top_3_cities = @merchant.top_3_cities
    @most_ordering_user = @merchant.most_ordering_user
    @most_items_user = @merchant.most_items_user
    @most_items_user = @merchant.most_items_user
    @top_3_revenue_users = @merchant.top_3_revenue_users
    @having_problems = @merchant.problems_with_fulfillment?
    @low_stock_items = @merchant.low_stock_items
    @placeholders = @merchant.items_with_placeholders
    if @orders
      @cancellation_rate = @merchant.cancellation_rate
    else
      @cancellation_rate = 0
    end
    @my_orders = @merchant.all_my_orders
    @any_cancellations = @my_orders.any? { |order| order.status == "cancelled"}
  end

  private

  def require_merchant
    render file: 'errors/not_found', status: 404 unless current_user && current_merchant?
  end
end
