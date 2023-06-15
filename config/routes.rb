Rails.application.routes.draw do
  get 'directions/sort'
  get 'invitations/create'
  get 'invitations/destroy'
  get 'invitations/update'
  get 'invitations/edit'

  # devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  resources :invitations
  resources :friendconnects
  # resources :recipes

  resources :recipes do
    # resources :directions do
      put :sort, on: :collection
    # end
  end

  resources :directions do
    put :sort, on: :collection
  end


  # resources :groups
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
  # get 'users/:id' => 'users#index', as: :users

  root to: 'home#index'
end
