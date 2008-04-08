class SiteController < ApplicationController
  def about
    
  end
  
  def contact
  
  end
  
  def work
    @portfolio = PortfolioImage.find(:all, :order => 'position')
    unless params[:id].nil?
      @image = PortfolioImage.find(params[:id])
      @next = @image.position == @portfolio.length ? @portfolio.first : @portfolio[@image.position]
    else
      redirect_to "/work/" + @portfolio.first.id.to_s
    end
  end
end
