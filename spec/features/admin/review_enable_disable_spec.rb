require 'rails_helper'

describe 'Admin review workflow' do
  before(:each) do
    yesterday = 1.day.ago
    @user = create(:user)
    @admin = create(:admin)

    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)

    @item_1 = create(:item, user: @merchant_1)
    @item_2 = create(:item, user: @merchant_2)

    @order = create(:completed_order, user: @user, created_at: yesterday)
    @oi_1 = create(:fulfilled_order_item, order: @order, item: @item_1, price: 1, quantity: 3, created_at: yesterday, updated_at: yesterday)
    @oi_2 = create(:fulfilled_order_item, order: @order, item: @item_2, price: 2, quantity: 5, created_at: yesterday, updated_at: 2.hours.ago)

    @review_1 = Review.create(title: "Amazing product!", rating: 5, description: "fgnribtdufbgiu feowapghi goeiwgbhigl932409htgibn", item: @item_1, user: @user)
    @review_2 = Review.create(title: "Garbage...", rating: 1, description: "my review goes here blah blah", item: @item_1, user: @user, visibility: false)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  it 'can disable any visible reviews' do
    visit item_path(@item_1)

    click_link @review_1.title
    expect(current_path).to eq(item_review_path(@item_1, @review_1))
    expect(page).to have_button("Disable")
    expect(page).to_not have_button("Enable")

    click_button "Disable"
    expect(current_path).to eq(item_path(@item_1))
    expect(page).to have_content("This review has been hidden. To make it visible again, click the Enable button.")
    expect(page).to have_button("Enable")
    expect(page).to_not have_button("Disable")
  end
  it 'can enable any hidden reviews' do
    visit item_path(@item_1)
    expect(page).to have_content("Hidden Reviews")
    within(".hidden-reviews") do
      expect(page).to have_button("Enable")
      click_button "Enable"
    end
    expect(current_path).to eq(item_path(@item_1))
    expect(page).to have_content("This review is now visible. To make it hidden, click the Disable button.")
    expect(page).to_not have_button("Enable")
  end
end
