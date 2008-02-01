ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :path_prefix => "/blog"

  # The priority is based upon order of creation: first created -> highest priority.
  map.home '', :controller => 'site', :action => 'home'
  map.about '/about', :controller => 'site', :action => 'about'
  map.contact '/contact', :controller => 'site', :action => 'contact'
  map.blog '/blog', :controller => 'posts', :action => 'index'


  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
