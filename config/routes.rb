ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.home '', :controller => 'site', :action => 'home'
  map.about '/about', :controller => 'site', :action => 'about'
  map.contact '/contact', :controller => 'site', :action => 'contact'


  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
