StudySpots::Application.routes.draw do
  
  root :to=> 'pages#home'
  
  get "pages/home"

  get "pages/contact"

  get "pages/about"

  Possible_locales = /en|pt|es/
  
  match "/:locale" => "accounts#index", :locale => Possible_locales
  match "/:locale/accounts/email/:id" => "accounts#email"
  match "/:locale/spots/owner/:id" => "spots#owner"
  match "/:locale/spots/join/" => "spots#join"
  match "/:locale/spots/joined/:id" => "spots#joined"
  match "/:locale/spots/inspot/:id" => "spots#inspot"
  
  root :to=> "accounts#index", :locale => Possible_locales
  
  scope :path => "(:locale)", :shallow_path => "(:locale)", :locale => Possible_locales do
    resources :accounts
    resources :profiles
    resources :spots
  end
  
#  get "accounts/new"
#
#  resources :accounts
#  resources :profiles
#  get "sign_up" => "accounts#new", :as => "sign_up"
#  root :to => 'accounts#index'
  
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
