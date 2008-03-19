ActionController::Routing::Routes.draw do |map|

  map.home '', :controller => 'site', :action => 'home'
  map.about '/about', :controller => 'site', :action => 'about'
  map.contact '/contact', :controller => 'site', :action => 'contact'
  map.blog '/blog', :controller => 'site', :action => 'blog'
  map.work '/work/:id', :controller => 'site', :action => 'work'

  map.resources :posts, :path_prefix => "/blog", :member => { :comment => :post } do |post|
    post.resources :tags
  end
  
  map.resources :portfolio
    
  map.namespace:admin do |admin|
    admin.resources :posts,
      :has_many => [ :comments, :tags ]
    admin.resources :portfolio, :as => 'portfolio'
  end
end
