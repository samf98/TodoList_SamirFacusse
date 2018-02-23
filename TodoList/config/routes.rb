Rails.application.routes.draw do
  	devise_for :users
  	resources :categories
  	resources :todos
  	root 'categories#index'
end
