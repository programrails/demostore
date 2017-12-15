Rails.application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :line_items
    resources :orders
    resources :carts
    resources :products
    resources :categories

    resources :users, only: [:index, :show, :edit, :update, :destroy] # after devise_for :users!!!!
  end

  resources :carts, only: [:show, :update]
  # resources :categories, only: [:index, :show]
  resources :line_items, only: [:update, :destroy]
  resources :orders, only: [:show, :new, :create]  
  resources :products, only: [:index, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update] # after devise_for :users!!!!

  root to: "products#index"

  get '/description' => 'pages#description'
  get '/reference' => 'pages#reference'
  
  get '/reset' => 'reset#reset'
  delete '/regenerate' => 'reset#regenerate'

end
