class SiteController < ApplicationController
  def about
    
  end
  
  def contact
  
  end
  
  def blog
    @posts = Post.find(:all)
    @tags = Tag.find(:all)
  end
  
  def work
    unless params[:id].nil?
      @image = PortfolioImage.find(params[:id])
      @portfolio = PortfolioImage.find(:all)
    else 
      redirect_to "/work/1"
    end
  end
  
end
