# Turing Mod 2 Backend Engineering 1810
# Final Project: Extensions to Little Shop

A Turing School solo project created with Ruby on Rails.

![LittleShop](/readme/landing.png)

This project was an extension to our group project, Little Shop:
`https://github.com/cebarks/littleshop`
However, we were given a fresh code base for this round, so that the focus could simply be on the back-end extensions we were assigned to engineer. The fresh code base can be found at:
`fresh code base link`

The extensions I worked on are:

## **Users can rate items (counts as 1 extension point)**

Users will have the ability to leave ratings for items they have successfully purchased.

Users cannot rate items from orders which have been canceled by the user or an admin.

Users can write one rating per item per order. If the user orders an item (in any quantity) they can leave one rating. If they order the item again in a different order, the user can leave another rating.

Build all CRUD functionality for users to add a rating through their order show page.

Users can disable any rating they created. Admins can enable or disable any rating.

Disabled ratings should not factor into total counts of ratings, nor averages of ratings.

Ratings will include a title, a description, and a rating from 1 to 5.

## **Mod 2 Learning Goals reflected:**

- Database relationships
- Rails development (including routing)
- Software Testing
- HTML/CSS styling and layout

---

## **Merchant To-Do List (counts as 1 extension point)**

Merchants who visit their dashboard should see a list of "to-do" tasks such as:

- fixing items which are using a placeholder image
    - each of these items will appear on the dashboard page with a link going directly to that item's edit page where they can set a new image URL
- a count of how many orders are unfulfilled and the revenue impact ("You have 5 unfulfilled orders worth $752.86")

## **Mod 2 Learning Goals reflected:**

- MVC and Rails development
- Database relationships and migrations
- ActiveRecord
- Software Testing
