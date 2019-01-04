require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

OrderItem.destroy_all
Order.destroy_all
Item.destroy_all
User.destroy_all

admin = create(:admin)
user_1 = create(:user)
user_2 = create(:user)
user_3 = create(:user)
user_4 = create(:user)
merchant_1 = create(:merchant)

merchant_2, merchant_3, merchant_4 = create_list(:merchant, 3)

inactive_merchant_1 = create(:inactive_merchant)
inactive_user_1 = create(:inactive_user)

item_1 = create(:item, user: merchant_1)
item_2 = create(:item, user: merchant_2)
item_3 = create(:item, user: merchant_3)
item_4 = create(:item, user: merchant_4)
create_list(:item, 10, user: merchant_1)

inactive_item_1 = create(:inactive_item, user: merchant_1)
inactive_item_2 = create(:inactive_item, user: inactive_merchant_1)

Random.new_seed
rng = Random.new

order = create(:completed_order, user: user_2)
create(:fulfilled_order_item, order: order, item: item_1, price: 1, quantity: 1, created_at: rng.rand(3).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_3, price: 3, quantity: 1, created_at: rng.rand(5).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_4, price: 4, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)

order = create(:order, user: user_1)
create(:order_item, order: order, item: item_1, price: 1, quantity: 1)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).days.ago, updated_at: rng.rand(23).hours.ago)

order = create(:cancelled_order, user: user_3)
create(:order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)
create(:order_item, order: order, item: item_3, price: 3, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)

order = create(:completed_order, user: user_4)
create(:fulfilled_order_item, order: order, item: item_1, price: 1, quantity: 1, created_at: rng.rand(4).days.ago, updated_at: rng.rand(59).minutes.ago)
create(:fulfilled_order_item, order: order, item: item_2, price: 2, quantity: 1, created_at: rng.rand(23).hour.ago, updated_at: rng.rand(59).minutes.ago)

Review.create(item: item_1, user: user_1, title: Faker::LeagueOfLegends.quote, description: Faker::MichaelScott.quote, rating: Faker::Number.between(1, 5))
Review.create(item: item_2, user: user_2, title: Faker::LeagueOfLegends.quote, description: Faker::MichaelScott.quote, rating: Faker::Number.between(1, 5))
Review.create(item: item_3, user: user_3, title: Faker::LeagueOfLegends.quote, description: Faker::MichaelScott.quote, rating: Faker::Number.between(1, 5))
Review.create(item: item_4, user: user_4, title: Faker::LeagueOfLegends.quote, description: Faker::MichaelScott.quote, rating: Faker::Number.between(1, 5))
Review.create(item: item_1, user: user_3, title: Faker::LeagueOfLegends.quote, description: Faker::MichaelScott.quote, rating: Faker::Number.between(1, 5))
Review.create(item: item_4, user: user_3, title: Faker::LeagueOfLegends.quote, description: Faker::MichaelScott.quote, rating: Faker::Number.between(1, 5))
