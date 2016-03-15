# Fixed Gear Nation

A fixed gear bicycle is a simple, single-speed bicycle with a 'fixed' cog instead of a freewheel.  In other words, fixed gear bicycles do not coast.  To it's owner, a fixed gear bicycle can be an expression of individuality. 

 **Fixed Gear Nation** is a community website for fixed gear bicycle enthusiasts.  Community members can browse fixed gear bikes and show off their own bike(s).  Fixed gear bicycles can be built up in an amazingly wide variety of ways depending on style and preference.   No two fixed gear bicycles are the same. 

# Version 1 Features

* Users can browse a newsfeed of posted bikes.  Each bike includes a bike name, description, and thumbnail image. (Read from database)
* Users can post bikes including location - with geolocation autofill. (Create in database)
* Users can upvote bikes.  One vote per user per bike.
* Each user and bike has a friendly, readable URL.
* Users can see the details of a bike, including a larger photo and a zoom photo. 
* Users can comment on a bike
* Users can see their own bike (or quiver of bikes) on their profile page.
* Users can see other user's profile pages, including their quiver of bikes
* Users can edit or delete their own bikes on the bike details page (Update, Delete in database)
* Date of post is listed next to each bike
* Users receive a welcome email when they sign up
* Users can contact the developer with any feedback via a contact form

# Technologies used

* Ruby on Rails
* ERB templating
* Bootstrap CSS for responsive design
* Bootswatch Cosmo CSS template
* Acts as Votable gem for upvoting
* FriendlyId gem for vanity URLs
* Rspec gem for testing models and controllers
* Bcrypt gem for user authorization / password security
* Paperclip gem for image upload
* Amazon AWS S3 for image storage
* Postgres database
* Heroku app hosting

# Wishlist

* 'Forgot password' helper
* Sort bikes by popularity of vote or by order of date posted 
* Search for bikes - keyword search
* Report post - if innapproriate or offensive
* Better design
* Admin dashboard for deleting / editing bikes / users
* Facebook login - oAuth
* Users are notified when someone comments on their bike
* Users can message each other
* Users can add multiple photos of their bike
* Users can easily share bikes via a share button

# Live app

Join the Fixed Gear Nation at  <http://www.fixedgearnation.com>  

# Developers

* Dave Sloan - <https://github.com/slnwlf>
* Trung Huynh - <https://github.com/tkhuynh>
* John Dwyer - <https://github.com/Jsdwyer26>
 