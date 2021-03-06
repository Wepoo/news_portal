Rails.application.routes.draw do

  get 'hello_world', to: 'hello_world#index'
  root to: 'articles#index'
  devise_for :users, controllers: { registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users
  resources :articles do
    resources :comments#, only: :create
    get :autocomplete_tag_name, :on => :collection
  end
  resources :categories
  
  get 'feeds/index'

  get 'feeds/show'


  get 'tags/:tag', to: 'articles#index', as: :tag
  
  get '/last_updated' => 'articles#last_updated', as: :last_updated
  get '/interesting' => 'articles#interesting', as: :interesting
  get '/suggested' => 'articles#suggested', as: :suggested

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
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
