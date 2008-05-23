# Merb::Router is the request routing mapper for the merb framework.
#
# You can route a specific URL to a controller / action pair:
#
#   r.match("/contact").
#     to(:controller => "info", :action => "contact")
#
# You can define placeholder parts of the url with the :symbol notation. These
# placeholders will be available in the params hash of your controllers. For example:
#
#   r.match("/books/:book_id/:action").
#     to(:controller => "books")
#   
# Or, use placeholders in the "to" results for more complicated routing, e.g.:
#
#   r.match("/admin/:module/:controller/:action/:id").
#     to(:controller => ":module/:controller")
#
# You can also use regular expressions, deferred routes, and many other options.
# See merb/specs/merb/router.rb for a fairly complete usage sample.

Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  
  # This is the default route for /:controller/:action/:id
  # This is fine for most cases.  If you're heavily using resource-based
  # routes, you may want to comment/remove this line to prevent
  # clients from calling your create or destroy actions with a GET
  # r.default_routes
  
  # = Admin
  r.namespace :admin do |a|
    # = Resources
    a.resources :posts
    a.resources :pages
    
    # = Pages
    a.match('').to(:controller => 'posts', :action => 'index').name(:admin_home)
  end
  
  # = Resources
  r.resources :posts
  r.resources :pages
  r.resources :sessions
  
  # = Shortcuts
  r.match('/login').to(:controller => 'sessions', :action => 'new').name(:login)
  r.match('/logout').to(:controller => 'sessions', :action => 'delete').name(:logout)
  
  # = Pages
  # Change this for your home page to be available at /
  r.match('/').to(:controller => 'pages', :action =>'home').name(:home)
  
end
