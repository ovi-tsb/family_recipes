Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  

    get 'home/index'

    get 'directions/sort'
    get 'invitations/create'
    get 'invitations/destroy'
    get 'invitations/update'
    get 'invitations/edit'

    # get 'recipes/index'
    # get 'recipes/:id' => 'recipes#index', as: :recipes

    # resources :recipes 
    resources :invitations
    resources :friendconnects

    resources :directions do
      put :sort, on: :collection
    end
    # devise_for :users
    
    root to: 'home#index'


    
    devise_for :users
    get 'users/:id' => 'users#show', as: :users
    
    resources :recipes
  end
  # resources :recipes
end
# http://localhost:3000/15/recipes
# http://localhost:3000/ro/recipes
# http://localhost:3000/ro/recipes?utf8=✓&search=&friend_filter=&category_filter=Desert
# http://localhost:3000/recipes?locale=ro
# http://localhost:3000/recipes?utf8=✓&search=&friend_filter=&category_filter=Desert




# http://localhost:3000/ro/users/15
# http://localhost:3000/recipes.15?locale=ro
# http://localhost:3000/en/recipes/index
# http://localhost:3000/en/users/15
# http://localhost:3000/recipes.15?locale=en

# http://localhost:3000/ro/recipes/index
# http://localhost:3000/recipes?utf8=✓&search=&friend_filter=&category_filter=Desert

# http://localhost:3000/recipes?utf8=✓&search=&friend_filter=&category_filter=Desert
# http://localhost:3000/ro/recipes?utf8=✓&search=&friend_filter=&category_filter=Desert




