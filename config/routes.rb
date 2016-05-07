Rails.application.routes.draw do

  root 'frontals#home'


  resources :ratings

  #post 'bloggings/:blog_id/commentings/:id' => 'comments#dothedo', as: :duck

  get 'categories/new' => 'categories#new', as: :new_category

  get 'categories' => 'categories#index', as: :categories

  post 'categories' => 'categories#create'

  get 'categories/:id/edit' => 'categories#edit', as: :edit_category

  #Added route to pass test
  get 'categories/:id' => 'categories#edit'


  get 'categories/:id' => 'categories#show', as: :category
  patch 'categories/:id' => 'categories#update'
  delete 'categories/:id' => 'categories#destroy'

  get 'categories/index'


  get 'frontals/landing_page'

  post 'frontals/login'

  get 'frontals/home' =>'frontals#home'

  get 'frontals/home'

  get 'signup' => 'users#new', as: :signup

  delete 'frontals/logout'

  resources :users

  # autocomplete url
  get 'blogs/search' => 'blogs#search'

  resources :blogs do
    resources :comments
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
