class UsersController < ApplicationController
	root to: "users#index"
	resources :users
end
