Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :orders
  get 'nasa_api/index'
  get 'nasa_api' => 'nasa_api#index'
  resources :sponsors
  get 'sponsor', to: 'sponsors#index'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :users
  get 'users/:id', to: 'users#show', as: 'userp'
  get 'users/edit', to: 'users#edit'
  resources :planets
  devise_for :user
  root 'planets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
