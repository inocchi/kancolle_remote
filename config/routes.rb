KancolleRemote::Application.routes.draw do
  get "bokou/show"
  post "bokou/battle"
  post "bokou/hensei"
  post "bokou/hokyu"
  post "bokou/kaisou"
  post "bokou/nyukyo"
  post "bokou/kousyo"

  get "battle_top/show"
  post "battle_top/battle"
  post "battle_top/practice"
  post "battle_top/ensei"

  get "battle/show"

  get "practice/show"

  get "ensei/show"
  post "ensei/change_area"
  post "ensei/select_mission"

  get "hensei/show"

  get "hokyu/show"

  get "kaisou/show"

  get "nyukyo/show"

  get "kousyo/show"

  post "left_menu/bokou"
  post "left_menu/hensei"
  post "left_menu/hokyu"
  post "left_menu/kaisou"
  post "left_menu/nyukyo"
  post "left_menu/kousyo"

  post "packet/notify_post"
  post "packet/notify_response"

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
