## Fixed Gear Nation

A fixed gear bicycle is a single-speed bicycle without a freewheel. **Fixed Gear Nation** is a community website for Fixed gear bicycle enthusiasts.  Community members can browse fixed gear builds and post their own personal bikes.

# MVP Features

* Users can browse a newsfeed of posted bikes.  Each bike includes a name, description, and thumbnail image. (Read)
* Users can post bikes. (Create)
* Users can upvote bikes.  One vote per user per bike.
* Users can share bike URLs - each bike has a readable URL.
* Users can see the details of a bike, including a larger photo. 
* Users can see their own bike (or quiver of bikes) on their profile page
* Users can edit or delete their own bikes on the bike details page (Update, Delete)
* Date of post is listed next to each bike

# Technologies used

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
* Heroku app hosting

# Wishlist

* 'Forgot password' helper
* Better responsive behavior
* Bike attribute:  location
* Sort bikes by popularity of vote or by order of date posted 
* Search for bikes - keyword search
* Report post - if innapproriate or offensive
* Contact the developer - for inquiries and bug reporting
* Page views for bike details page
* Client-side validations
* Zoom photo on bike details page
* Push to public site: www.fixedgearnation.com
* Better design
* Each bike div in index page is clickable 
* Admin dashboard for deleting / editing bikes
* Social login - oAuth

# Heroku app

Can be found at  <http://fixedgearnation.herokuapp.com>  
 