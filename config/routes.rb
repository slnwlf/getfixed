Rails.application.routes.draw do

  root to: "bikes#index"
  # use resources to set all CRUD routes for bikes
  resources :bikes do
  	member do
  		put "like", to: "bikes#upvote"
  	end
  end

#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         bikes#index
# like_bike PUT    /bikes/:id/like(.:format) bikes#upvote
#     bikes GET    /bikes(.:format)          bikes#index
#           POST   /bikes(.:format)          bikes#create
#  new_bike GET    /bikes/new(.:format)      bikes#new
# edit_bike GET    /bikes/:id/edit(.:format) bikes#edit
#      bike GET    /bikes/:id(.:format)      bikes#show
#           PATCH  /bikes/:id(.:format)      bikes#update
#           PUT    /bikes/:id(.:format)      bikes#update
#           DELETE /bikes/:id(.:format)      bikes#destroy
#     login GET    /login(.:format)          sessions#new
#           POST   /login(.:format)          sessions#create
#    logout GET    /logout(.:format)         sessions#destroy
#    signup GET    /signup(.:format)         users#new
#     users POST   /users(.:format)          users#create
#           PUT    /users/:id(.:format)      users#update
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy

	get "/login" => "sessions#new"
	post "/login" => "sessions#create"
	get "/logout" => "sessions#destroy"
	get "/signup" => "users#new"
	post "/users" => "users#create"
  put "users/:id" => "users#update"

  resources :users, :except => [:index]

end
