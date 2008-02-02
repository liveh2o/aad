class SiteController < ApplicationController
  def about
    
  end
  
  def contact
  
  end
  
  def blog
    @posts = Post.find(:all)
    @tags = Tag.find(:all)
  end
end
