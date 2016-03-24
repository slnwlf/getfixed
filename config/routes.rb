Rails.application.routes.draw do

  get 'secret/index'

  root to: "bikes#index"
  # use resources to set all CRUD routes for bikes
  resources :bikes do
  	member do
  		put "like", to: "bikes#upvote"
  	end
  end

  resources :bikes do
    resources :comments, except: [:index, :show]
  end

#            Prefix Verb   URI Pattern                                 Controller#Action
#              root GET    /                                           bikes#index
#         like_bike PUT    /bikes/:id/like(.:format)                   bikes#upvote
#             bikes GET    /bikes(.:format)                            bikes#index
#                   POST   /bikes(.:format)                            bikes#create
#          new_bike GET    /bikes/new(.:format)                        bikes#new
#         edit_bike GET    /bikes/:id/edit(.:format)                   bikes#edit
#              bike GET    /bikes/:id(.:format)                        bikes#show
#                   PATCH  /bikes/:id(.:format)                        bikes#update
#                   PUT    /bikes/:id(.:format)                        bikes#update
#                   DELETE /bikes/:id(.:format)                        bikes#destroy
#     bike_comments POST   /bikes/:bike_id/comments(.:format)          comments#create
#  new_bike_comment GET    /bikes/:bike_id/comments/new(.:format)      comments#new
# edit_bike_comment GET    /bikes/:bike_id/comments/:id/edit(.:format) comments#edit
#      bike_comment PATCH  /bikes/:bike_id/comments/:id(.:format)      comments#update
#                   PUT    /bikes/:bike_id/comments/:id(.:format)      comments#update
#                   DELETE /bikes/:bike_id/comments/:id(.:format)      comments#destroy
#                   GET    /bikes(.:format)                            bikes#index
#                   POST   /bikes(.:format)                            bikes#create
#                   GET    /bikes/new(.:format)                        bikes#new
#                   GET    /bikes/:id/edit(.:format)                   bikes#edit
#                   GET    /bikes/:id(.:format)                        bikes#show
#                   PATCH  /bikes/:id(.:format)                        bikes#update
#                   PUT    /bikes/:id(.:format)                        bikes#update
#                   DELETE /bikes/:id(.:format)                        bikes#destroy
#             login GET    /login(.:format)                            sessions#new
#                   POST   /login(.:format)                            sessions#create
#            logout GET    /logout(.:format)                           sessions#destroy
#            signup GET    /signup(.:format)                           users#new
#             users POST   /users(.:format)                            users#create
#                   PUT    /users/:id(.:format)                        users#update
#                   POST   /users(.:format)                            users#create
#          new_user GET    /users/new(.:format)                        users#new
#         edit_user GET    /users/:id/edit(.:format)                   users#edit
#              user GET    /users/:id(.:format)                        users#show
#                   PATCH  /users/:id(.:format)                        users#update
#                   PUT    /users/:id(.:format)                        users#update
#                   DELETE /users/:id(.:format)                        users#destroy
#           contact POST   /contact(.:format)                          contacts#create
#       new_contact GET    /contact/new(.:format)                      contacts#new

	get "/login" => "sessions#new"
	post "/login" => "sessions#create"
	get "/logout" => "sessions#destroy"
	get "/signup" => "users#new"
	post "/users" => "users#create"
  put "users/:id" => "users#update"

  resources :users, :except => [:index]

  resource :contact, only: [:new, :create]

end
