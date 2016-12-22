Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  root "users#main_form"
  
  get '/auth/:provider/callback', to: 'sessions#create'

  get 'user/new' => 'users#new', as: :user_new

  post 'user' => 'users#create', as: :user_create
  
  get 'user/form' => 'users#main_form', as: :main_form


  get 'user/login' => 'sessions#new', as: :login_form

  post 'user/login_form' => 'sessions#create', as: :login_create


  get 'user/event_form/:user_id' => 'events#new', as: :event_new


  post 'user/event_create/:user_id' => 'events#create', as: :event_create

  # patch 'user/event_edit_save' => 'events#edit_save', as: :event_edit_save

  get "event/:user_id/:event_id" => "events#delete", as: :event_destroy

  get 'log_out' => 'events#destroy', as: :log_out

  get 'edit/:user_id/:event_id' => 'events#edit', as: :event_edit

  get 'edit/:event_id' => 'events#show', as: :event_show

  put "edit/:user_id/:event_id" => "events#update", as: :event_update

  get "user/edit/:user_id" => "users#edit" , as: :user_edit

  put 'user/create/:user_id' => 'users#update', as: :user_update

  get 'user/show/:user_id' => 'users#show', as: :user_show

  get '/patient' => 'patients#new', as: :patient_new

  post '/patient' => 'patients#create', as: :patient_create

  get '/patient/:patient_id' => 'patients#show' , as: :patient_show

  post 'comment/create/:event_id' => 'comments#create', as: :comment_create

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
