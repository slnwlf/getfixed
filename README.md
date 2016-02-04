# Fixed Gear Nation

**Fixed Gear Nation** is a community site for Fixed gear bicycle enthusiasts.  Community members can check out fixed gear builds and post their own bikes.

## Features

* Users can see a newsfeed of posted bikes with name, description, and thumbnail image.
* Users can post a bike with name, description, and photo.
* Users can upvote bikes.  One vote per user per bike.
* Users can share bike URLs - each bike has a readable URL.
* Users can see the details of a bike, including a larger photo. 
* Users can see their own bike (or quiver of bikes) on their profile page
* Users can edit or delete their own bikes on the bike details page
* Date of post is listed next to each bike

## Technologies used

* Ruby on Rails
* Bootstrap CSS for responsive design
* Bootswatch Cosmo CSS template
* Acts as Votable gem for upvoting
* FriendlyId gem for vanity URLs
* Rspec gem for testing models and controllers
* Bcrypt gem for user authorization / password security
* Paperclip gem for image upload
* Amazon AWS S3 for image storage
* Postgres database
* Heroku for app hosting

## Wishlist

* Forgot password helper
* Better responsive behavior
* Bike attribute:  location
* Sort bikes by popularity of vote
* Search for bikes
* Report post - innapproriate 
* Contact me - for inquiries or bug reporting
* Page views for bike details page
* Client-side validations
* Zoom photo on bike details page