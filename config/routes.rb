Wallpaper::Application.routes.draw do
  
  resources :videos

  resources :directories

 #resources :favorites

  resources :users

  resources :gallery_items

  resources :galleries

  resources :news_categories

  resources :news

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'

 match 'favorites_for_user/:id' => 'favorites#filter'

match 'filter_gallery_items/:id' => 'gallery_items#filter'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  match 'news_ajax/:id' => 'news#news_ajax'
  match 'gallery_ajax/:id' => 'galleries#gallery_ajax'
  match 'directory_ajax/:id' => 'directories#directory_ajax'
  match 'news_bb/:id' => 'news#news_bb'
  match 'directory_bb/:id' => 'directories#directory_bb'
  
  
  
  match 'mobile/iphone_cover.:format' => 'mobile#iphone_cover'
  # match 'mobile/article_categories.:format' => 'mobile#article_categories'
  # match 'mobile/article_category/:id.:format' => 'mobile#article_category'
  match 'mobile/news.json' => 'mobile#news'
  match 'mobile/news/:id.html' => 'mobile#get_news'
  
  
  match 'mobile/galleries.json' => 'mobile#galleries'
  match 'mobile/gallery/:id.html' => 'mobile#get_gallery'
  # match 'mobile/article/:id.:format' => 'mobile#article'
  
  match 'mobile/directories.json' => 'mobile#directories'
  match 'mobile/directory/:id.html' => 'mobile#get_directory'
  
  match 'mobile/videos.json' => 'mobile#videos'
  match 'mobile/video/:id.html' => 'mobile#get_video'
  
  
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"
  root :to => "welcome#index"
  match 'iphone' => 'welcome#redirect_to_iphone'


  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
match 'favorites/fav_add',:controller =>'favorites', :action=>'fav_add'
resources :favorites
match ':controller(/:action(/:id(.:format)))'



end
