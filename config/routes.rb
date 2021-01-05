Rails.application.routes.draw do
  devise_for :users
  resources :roles
  root 'users#index'
  
end
