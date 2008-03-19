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
    @portfolio = PortfolioImage.find(:all)
    unless params[:id].nil?
      @image = PortfolioImage.find(params[:id])
    else 
      redirect_to "/work/" + @portfolio.first.id.to_s
    end
  end
  
end
