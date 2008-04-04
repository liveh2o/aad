ActionController::Routing::Routes.draw do |map|
  # Home page
  map.home '', :controller => 'site', :action => 'home'
  # About page
  #map.about '/about', :controller => 'site', :action => 'about'
  # Contact page
  map.contact '/contact', :controller => 'site', :action => 'contact'
  # Blog
  map.blog '/blog', :controller => 'posts'
  # Blog posts by date
  map.connect '/blog/:year/:month/:day/:title',
    :controller => 'posts',
    :action => 'show_by_date',
    :requirements => { :year => /\d{4}/, 
        :day => /\d{1,2}/,
        :month => /\d{1,2}/ }
  # Blog posts by year
  map.connect '/blog/:year',
    :controller => 'posts',
    :action => 'index_by_year',
    :requirements => { :year => /\d{4}/ }
  # Blog comment
  map.connect '/blog/:id/comment',
    :controller => 'posts',
    :action => 'comment',
    :method => :post
  # Work page
  map.work '/work/:id', :controller => 'site', :action => 'work'
  # Admin section
  map.admin '/admin', :controller => 'admin'
  # Login page
  map.login '/admin/login', :controller => 'admin', :action => 'login'
  # Logout
  map.logout '/admin/logout', :controller => 'admin', :action => 'logout'
  # Portfolio and blog images
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
