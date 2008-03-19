class Admin::PortfolioController < ApplicationController
  layout 'posts'
  
  # GET /portfolio
  # GET /portfolio.xml
  def index
    @portfolio = PortfolioImage.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @tags.to_xml }
    end
  end

  # GET /portfolio/1
  # GET /portfolio/1.xml
  def show
    @image = PortfolioImage.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @tag.to_xml }
    end
  end

  # GET /portfolio/new
  def new
    @image = PortfolioImage.new
  end

  # GET /portfolio/1;edit
  def edit
    @image = PortfolioImage.find(params[:id])
  end

  # POST /portfolio
  # POST /portfolio.xml
  def create
    @image = PortfolioImage.create(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to admin_portfolio_index_path }
        format.xml  { head :created, :location => admin_portfolio_url(@image) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors.to_xml }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @image = PortfolioImage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to admin_portfolio_index_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors.to_xml }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @image = PortfolioImage.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to admin_portfolio_index_path }
      format.xml  { head :ok }
    end
  end
end