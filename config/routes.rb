Mozapolis::Application.routes.draw do

  root :to => "static#home"

  # Pages
  #------
  match 'admin' => "secret#home"
  match 'register' => "static#register"
  resources :pages


  # Fans
  #-----
  devise_for :fans, :controllers => { :registrations => :fan_registrations }
  resources :fans, :only => [:show, :index]
  resources :fans do 
    resources :comments
  end


  as :fan do
    get    'fan/signin'  => 'devise/sessions#new',     :as => :new_fan_session
    post   'fan/signin'  => 'devise/sessions#create',  :as => :fan_session
    delete 'fan/signout' => 'devise/sessions#destroy', :as => :destroy_fan_session
  end


  # Artists
  #--------
  devise_for :artists, :controllers => { :registrations => :artist_registrations }
  resources :artists, :only => [:show, :index]
  resources :artists do 
    resources :comments
  end
  as :artist do
    get    'artist/signin'  => 'devise/sessions#new',     :as => :new_artist_session
    post   'artist/signin'  => 'devise/sessions#create',  :as => :artist_session
    delete 'artist/signout' => 'devise/sessions#destroy', :as => :destroy_artist_session
  end


  # Admins
  #-------
  devise_for :users


  # Engines
  #--------
  
  resources :notifications
  resources :playlists do
    collection { post :sort }
    resources :ptracks do 
      collection { post :addsong }
    end
  end
  resources :genres
  resources :pictures, :only => [:index, :create, :destroy]
  resources :videos do
    collection { post :sort }
    resources :comments
  end

  resources :events do
    collection { post :sort }
    resources :comments
  end
  resources :articles do
    collection { post :sort }
    resources :comments
  end

  resources :galleries do
    collection { post :sort }
    resources :comments
    resources :images
  end
  resources :images do 
    collection { post :sort }
    resources :comments
  end
  resources :albums do
    collection { post :sort }
    collection { post :upvote }
    collection { post :downvote }
    collection { post :unvote }
    resources :comments
    resources :songs
  end

  
  resources :songs do
    resources :comments
    collection { post :sort }
    collection { post :upvote }
    collection { post :downvote }
    collection { post :unvote }
  end
  # Admin Routes
  #-------------

  namespace :admin do
    resources :articles
    resources :events
    resources :galleries
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
