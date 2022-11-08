Rails.application.routes.draw do
  
  get 'invitations/create'
  get 'invitations/destroy'
  get 'invitations/update'
# devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy'
# end

  resources :invitations
  resources :friendconnects
  # resources :users
  # get 'users/:id' => 'users#show'
  # get 'users/index'
  get 'home/index'
  # devise_for :users
  
  # devise_for :users do 
  #   get '/users/sign_out' => 'devise/sessions#destroy' 
  #   get 'users/:id' => 'users#show', as: :user
  # end
  
  devise_for :users
  get 'users/:id' => 'users#show', as: :users
  

  root to: 'home#index'


 end
