ActionController::Routing::Routes.draw do |map|

  map.home '', :controller => 'site', :action => 'home'
  map.about '/about', :controller => 'site', :action => 'about'
  map.contact '/contact', :controller => 'site', :action => 'contact'
  map.blog '/blog', :controller => 'site', :action => 'blog'

  map.resources :posts, :path_prefix => "/blog" do |post|
    post.resources :comments
  end

  map.resources :tags
end
