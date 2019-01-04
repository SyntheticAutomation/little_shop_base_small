require 'rails_helper'

describe 'A registered user who visits our web app' do
  before(:each) do
    yesterday = 1.day.ago
    @user = create(:user)
    @admin = create(:admin)

    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)

    @item_1 = create(:item, user: @merchant_1)
    @item_2 = create(:item, user: @merchant_2)

    @order = create(:completed_order, user: @user, created_at: yesterday)
    @cancelled_order = create(:cancelled_order, user: @user, created_at: yesterday)
    @oi_1 = create(:fulfilled_order_item, order: @order, item: @item_1, price: 1, quantity: 3, created_at: yesterday, updated_at: yesterday)
    @oi_2 = create(:fulfilled_order_item, order: @order, item: @item_2, price: 2, quantity: 5, created_at: yesterday, updated_at: 2.hours.ago)
    @oi_3 = create(:fulfilled_order_item, order: @cancelled_order, item: @item_1, price: 1, quantity: 3)
    @oi_4 = create(:order_item, order: @order, item: @item_1, price: 1, quantity: 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it 'can leave a review on an order item' do
    title = "Amazing product!"
    description = "gendiobpshutigohbsifopg!!!!!nviovprei"
    rating = 5
    visit profile_order_path(@order)

    within("#oitem-#{@oi_1.id}") do
      click_button "Leave a Review"
      expect(current_path).to eq(new_item_review_path(@item_1))
    end

    fill_in :review_title, with: title
    fill_in :review_description, with: description
    fill_in :review_rating, with: rating

    click_button 'Create Review'

    expect(current_path).to eq(item_path(@item_1))
    expect(page).to have_content(description)
  end
  it 'can edit a review' do
    @review = Review.create(title: "Amazing product!", rating: 5, description: "fgnribtdufbgiu feowapghi goeiwgbhigl932409htgibn", item: @item_1, user: @user)
    visit item_path(@item_1)

    click_link(@review.title)
    expect(current_path).to eq(item_review_path(@item_1, @review))

    click_button("Edit Review")
    expect(current_path).to eq(edit_item_review_path(@item_1, @review))

    title = "Horrible!"
    description = "waste of my life to purchase this item. it did nothing for me"
    rating = 1

    fill_in :review_title, with: title
    fill_in :review_description, with: description
    fill_in :review_rating, with: rating

    click_on ("Update Review")

    expect(current_path).to eq(item_review_path(@item_1, @review))
    expect(page).to have_content(description)
  end
  it 'cannot edit a review they didnt write' do
    @user_1 = create(:user)
    @review = Review.create(title: "Amazing product!", rating: 5, description: "fgnribtdufbgiu feowapghi goeiwgbhigl932409htgibn", item: @item_1, user: @user_1)
    visit item_path(@item_1)

    click_link(@review.title)
    expect(current_path).to eq(item_review_path(@item_1, @review))
    expect(page).to_not have_content("Edit Review")
  end
end
