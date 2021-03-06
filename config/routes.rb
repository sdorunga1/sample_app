SampleApp::Application.routes.draw do
 
  resources :users do #creates a link to users paths and also adds RESTful actions like CRUD
    member do #makes the route respond to URIs containing the user id : /users/1/followers and /users/1/following
      get :following, :followers
    end#it could have been collection in which case it does it without the id: /users/followers and /users/following
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  match '/signup', to: 'users#new'

  match 'signin', to: 'sessions#new'
  match 'signout', to: 'sessions#destroy', via: :delete

  root to: 'static_pages#home' #points localhost/ to static_pages's home controller

  match '/help', to: 'static_pages#help' #matches localhost/help url to point to the help method of static_pages controller
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
#also creates two helpers root_path which gives '\' and everything after and route_url whcih gives the full url



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
