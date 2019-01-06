# Turing Mod 2 Backend Engineering 1810
# Final Project: Extensions to Little Shop

A Turing School solo project created with Ruby on Rails.

![LittleShop](/readme/landing.png)
This project was an extension to our group project, Little Shop:

`https://github.com/cebarks/littleshop`

However, we were given a fresh code base for this round, so that the focus could simply be on the back-end extensions we were assigned to engineer. The fresh code base can be found at:

`https://github.com/iandouglas/little_shop_base_small`

The waffle project management board for this project can be found here:

`https://waffle.io/SyntheticAutomation/little_shop_base_small`


This project was designed to give us a chance to experiment a bit with our own creativity. Some of the main things I got to practice:

- Test Driven Development
- building CRUD functionality using Rails and all of its magic
- UX design
- Database relationships
- Rails development (including routing)
- Authentication and Authorization
- Statistics
- MVC and Rails development
- Database relationships and migrations
- ActiveRecord
- Software Testing
- Agile and project management tools

# **Extensions**
The extensions I worked on are:

## **Users can rate items (counts as 1 extension point)**

Users will have the ability to leave ratings for items they have successfully purchased.

Users cannot rate items from orders which have been canceled by the user or an admin.

Users can write one rating per item per order. If the user orders an item (in any quantity) they can leave one rating. If they order the item again in a different order, the user can leave another rating.

Build all CRUD functionality for users to add a rating through their order show page.

Users can disable any rating they created. Admins can enable or disable any rating.

Disabled ratings should not factor into total counts of ratings, nor averages of ratings.

Ratings will include a title, a description, and a rating from 1 to 5.

--

## **Merchant To-Do List (counts as 1 extension point)**

Merchants who visit their dashboard should see a list of "to-do" tasks such as:

- fixing items which are using a placeholder image
    - each of these items will appear on the dashboard page with a link going directly to that item's edit page where they can set a new image URL
- a count of how many orders are unfulfilled and the revenue impact ("You have 5 unfulfilled orders worth $752.86")

--

### Setup

You will need Rails version 5.1.
```
gem install rails -v 5.1
```
Clone down this repo via SSH:

```
git clone git@github.com:SyntheticAutomation/little_shop_base_small.git
```

From a shell, navigate into the project directory:

```
cd little_shop_base_small
```

Make sure your gemfile is up to date:

```
bundle update
```
Build the database in postgresql:

```
rake db:{drop,create,migrate,seed}
```
Start up your server:

```
rails s
```

Open your browser and explore this url:

`localhost:3000`

# **Backend Features**
- Registered users can now leave a review on an item they've purchased, and they can do this from their order show page via a "Leave Review" button.
- Registered users can edit, delete, hide, and re-enable their reviews.
- Registered users cannot leave a review if the order is cancelled or if the items in the order weren't fulfilled by the merchant.
- Reviews of an item can now be seen on the item's show page.
- Registered users cannot edit, disable, or delete other people's reviews.
- Registered users cannot leave more than one review on an item from the same order.
- Administrators can now edit, delete, hide, and re-enable all reviews.
- All review titles are links to their individual show page.
- The item show page now displays the amount of reviews it has, as well as its average rating.
- Registered users can no longer access other people's orders.
- Merchants now see a to-do list, which tracks:
  - if they have a high cancellation rate
  - the revenue impact of their unfulfilled orders
  - items in their inventory that are low and need to be restocked, and provides a restocking button

## Running the tests

Your location should be the root directory of the project (`little_shop`).

From the command line run

```
rspec
```

`Green` is passing.
`Red` is failing.

Test suite included use of:
- rspec
- capybara`
- shoulda-matchers
- FactoryBot
- Faker


## Acknowledgments

Project Leads/Instructors:
* Ian Douglas
* Dione Wilson
