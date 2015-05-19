Rails.application.routes.draw do
  
  get 'welcome/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
  #get 'welcome/:id' => 'catalog#view'

   
  get 'event/index' => 'event#index'
  
  get 'welcome/index' => 'welcome#index'
  
  get 'welcome/app_index' => 'welcome#app_index'
  
  get 'welcome/com_index' => 'welcome#com_index'
  
  get 'welcome/znap_index' => 'welcome#znap_index'
  
  get 'welcome/ha_index' => 'welcome#ha_index'
  
  get 'welcome/log_config' => 'welcome#log_config'
  
  post 'welcome/index_find' => 'welcome#index_find'
  
  post 'welcome/app_find' => 'welcome#app_find'
  post 'welcome/com_find' => 'welcome#com_find'
  post 'welcome/znap_find' => 'welcome#znap_find'
  post 'welcome/ha_find' => 'welcome#ha_find'
  
  resources :err_codes
  

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
