class Admin::PostsController < ApplicationController
  # Check for authorization
  before_filter :authorize
  # Set the layout
  layout 'admin'
  
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all)
    @links = Link.find(:all,:order => :position)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @posts.to_xml }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @post.to_xml }
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1;edit
  def edit
    @post = Post.find(params[:id])
    @post.image = BlogImage.new if @post.image.nil?
  end

  # POST /posts
  # POST /posts.xml
  def create
    @image = BlogImage.create(:data => params[:post][:data])
    params[:post].delete("data")
    
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        @image.post_id = @post.id;
        @image.save
        format.html { redirect_to admin_posts_url }
        format.xml  { head :created, :location => post_url(@post) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors.to_xml }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    unless @post.image.nil?
      @image = BlogImage.find(@post.image.id)
      @image.update_attribute(:data,params[:post][:data])
    else
      @image = BlogImage.create(:data => params[:post][:data])
      @post.image.id = @image.id
    end

    params[:post].delete("data")

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_posts_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors.to_xml }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.xml  { head :ok }
    end
  end
end
