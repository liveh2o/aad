ActionController::Routing::Routes.draw do |map|
  map.home '', :controller => 'site', :action => 'home'
  #map.about '/about', :controller => 'site', :action => 'about'
  map.contact '/contact', :controller => 'site', :action => 'contact'
  map.blog '/blog', :controller => 'site', :action => 'blog'
  map.work '/work/:id', :controller => 'site', :action => 'work'
  map.admin '/admin/', :controller => 'admin'

  map.resources :posts, :path_prefix => "/blog", :member => { :comment => :post } do |post|
    post.resources :tags
  end
  
  map.resources :portfolio
  map.resources :blog_images
    
  map.namespace:admin do |admin|
    admin.resources :posts,
      :has_many => [ :comments, :tags ]
    admin.resources :portfolio,
      :as => 'portfolio',
      :collection => { :sort_images => :post }
    admin.resources :links,
      :collection => { :sort_links => :post }
  end
end
