ActionController::Routing::Routes.draw do |map|

  # Single pages, not really "app" but used for marketing
  map.prices 'prices', :controller => "home", :action => "prices"
  map.signup 'signup', :controller => "home", :action => "signup"
  map.thank_you 'thank_you', :controller => "home", :action => "thank_you"

  map.resources :leads

  # Specific one of pages for this app
  map.root :controller => "home", :action => "index"
  map.account :controller => "plans", :action => "index"

  #User management
  map.login 'login', :controller => 'user_sessions', :action => 'new'  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'  
  map.resources :user_sessions
  map.resources :password_resets
  map.resources :users  

  #The app itself
  map.resources :plans, :member => { :daily => :get, :weekly => :get } do |plan|
    plan.resources :events
    plan.resources :lessons
  end

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
