class SiteController < ApplicationController
  def about
    
  end
  
  def contact
  
  end
  
  def blog
    @posts = Post.find(:all,:order => "posted_on DESC") 
    @tags = Tag.find(:all)
    @links = Link.find(:all,:order => :position)
  end
  
  def work
    @portfolio = PortfolioImage.find(:all, :order => 'position')
    unless params[:id].nil?
      @image = PortfolioImage.find(params[:id])
    else 
      redirect_to "/work/" + @portfolio.first.id.to_s
    end
  end
  
end
