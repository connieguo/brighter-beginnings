BrighterBeginnings::Application.routes.draw do
  resources :family_members

  resources :donations

  resources :families

  match '/users/main', :to => 'users#main', :as => 'user_main'
  resources :users

  get "pages/index"
  root :to => "pages#index"
  match '/signup', :to => 'users#new'
  #match '/home', :to => 'pages#donor'
  match '/profile', :to => 'users#main'  
  match '/auth/google/callback', :to => 'sessions#create', :as => 'login_callback'
  match '/auth/failure', :to => 'sessions#failed_login'
  match '/logout', :to => 'sessions#logout'
  match '/families/:id/family_members', :to => 'family_members#index', :as => 'family_details'
  match '/families/:id/family_members/new', :to => 'family_members#new', :as => "add_new_family_member"
  match '/donations/:id/new', :to => 'donations#new', :as => 'new_donor'
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
  # match ':controller(/:action(/:id(.:format)))'
end
