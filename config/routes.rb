Like4me::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  #devise_for :users
  devise_for :user, :path => '/admin', :path_names => { :sign_in => "login", :sign_out => "logout" }
  resources :admin, :only  => [:index]
  get 'admin/settings' => 'admin#settings'
  post 'admin/settings' => 'admin#settings'
  delete 'admin/settings' => 'admin#settings'
  put 'admin/settings' => 'admin#settings'


  scope "admin" do
    resources :textpages, :except => :show
    resources :questions, :except => :show
    resources :posts, :except => :show
    resources :feedback, :except => [:create, :new, :edit, :update]
  end

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
  root :to => 'main#index'
  match 'faq' => 'main#faq'
  match 'blog' => 'main#blog'
  match 'blog/:id' => 'main#blog_details'
  get 'feedback' => 'main#feedback'
  post 'feedback' => 'main#feedback'
  match "/auth/:provider/callback" => "site_sessions#create"
  match "/signout" => "site_sessions#destroy", :as => :signout
  match "/auth/failure" => 'main#index'
  match "cabinet" => 'cabinet#index'
  post '/cabinet/like_post' => 'cabinet#like_post'
  post '/cabinet/check_like' => 'cabinet#check_like'
  post '/cabinet/subscribe_group' => 'cabinet#subscribe_group'
  post '/cabinet/check_subscribe' => 'cabinet#check_subscribe'
  get '/cabinet/orders'           => 'cabinet#orders'
  delete '/cabinet/orders'  => 'cabinet#orders'
  post '/cabinet/update_balance' => 'cabinet#update_balance'
  get ':slug' => 'main#textpage'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
