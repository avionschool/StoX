Rails.application.routes.draw do
  resources :buyer_stocks
  resources :transactions
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  resources :roles
  root 'users#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  
end
