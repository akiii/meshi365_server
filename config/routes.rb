Meshi365::Application.routes.draw do
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
  match 'api/:uiid/food_line' => 'food_pictures#food_line'
  match 'api/:uiid/calender' => 'food_pictures#calender', :via => 'post'
  match 'api/post/food_picture' => 'food_pictures#post', :via => 'post'

  match 'api/:uiid/show' => 'users#show'
  match 'api/signup' => 'users#signup', :via => 'post'
  match 'api/me' => 'users#me', :via => 'post'
  match 'api/:uiid/friends' => 'users#friends'
  match 'api/:uiid/requesting_users' => 'users#requesting_users'
  match 'api/send_friend_request' => 'users#send_friend_request', :via => 'post'
  match 'api/:uiid/friends/search' => 'users#search_friends', :via => 'post'

  match 'cron/recommend_base_data/maintenance' => 'recommend#maintenance'
  match 'api/:uiid/recommend/group/stores' => 'recommend#group_stores'
  match 'api/:uiid/recommend/period/stores' => 'recommend#period_stores'
end
