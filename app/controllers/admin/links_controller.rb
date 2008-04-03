class Admin::LinksController < ApplicationController
  # Check for authorization
  before_filter :authorize
  # Set the layout
  layout 'admin'

  # GET /portfolio
  # GET /portfolio.xml
  def index
    @links = Link.find(:all,:order => "position")

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @links.to_xml }
    end
  end

  # GET /portfolio/1
  # GET /portfolio/1.xml
  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @link.to_xml }
    end
  end

  # GET /portfolio/new
  def new
    @link = Link.new
  end

  # GET /portfolio/1;edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /portfolio
  # POST /portfolio.xml
  def create
    @link = Link.create(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to admin_links_path }
        format.xml  { head :created, :location => admin_posts_path }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors.to_xml }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to admin_posts_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors.to_xml }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to admin_links_path }
      format.xml  { head :ok }
    end
  end

  def sort_links
    params[:links].each_with_index do |id, pos|
      Link.find(id).update_attribute(:position, pos+1)
    end
    render :nothing => true
  end
end
