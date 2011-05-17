class PortfolioController < ApplicationController
  def show
    @photo = PortfolioImage.find(params[:id])

    respond_to do |format|
      format.jpg  { render :inline => "@photo.operate {}", :type => :flexi }
    end
  end
end
