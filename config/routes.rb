Rails.application.routes.draw do

  root to: "bikes#index"
  # use resources to set all CRUD routes for bikes
  resources :bikes

#      Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         bikes#index
#     bikes GET    /bikes(.:format)          bikes#index
#           POST   /bikes(.:format)          bikes#create
#  new_bike GET    /bikes/new(.:format)      bikes#new
# edit_bike GET    /bikes/:id/edit(.:format) bikes#edit
#      bike GET    /bikes/:id(.:format)      bikes#show
#           PATCH  /bikes/:id(.:format)      bikes#update
#           PUT    /bikes/:id(.:format)      bikes#update
#           DELETE /bikes/:id(.:format)      bikes#destroy


  # root to: "users#index"
  # # use resources to set all CRUD routes for users
  # resources :users
end
