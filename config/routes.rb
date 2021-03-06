ActionController::Routing::Routes.draw do |map|

 
  # Specific one of pages for this app
  map.root :controller => "home", :action => "index"
  map.account 'account', :controller => "plans", :action => "show"

  #User management
  map.login 'login', :controller => 'user_sessions', :action => 'new'  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'  
  map.resources :user_sessions
  map.resources :password_resets
  map.resources :email_confirmations
  map.resources :users  

  #The app itself
  map.resources :plans, :member => { :daily => :get, :ical => :get } do |plan|
    plan.resources :events
    plan.resources :lessons, :collection => {:list => :get}
  end

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
