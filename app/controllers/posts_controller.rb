class PostsController < ApplicationController
  # Load initial data/settings
  before_filter :get_ready
  # Set the layout
  layout 'application'
  
  # GET /posts
  # GET /posts.xml
  def index

    respond_to do |format|
      format.html { render :template => 'site/blog' }
      format.xml  { render :xml => @posts.to_xml }
    end
  end
  
  # GET /blog/2008
  def index_by_year
    year = params[:year]

    @posts = Post.find(:all,:conditions => 'posted_on > ' + year, :order => "posted_on DESC")

    respond_to do |format|
      format.html { render :template => 'site/blog' }
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
  
  # GET /blog/2008/01/01/title
  def show_by_date
    title = params[:title].gsub(/-/,' ').upcase
    date = params[:year] + params[:month] + params[:day]
    @post = Post.find(:first,:conditions => "posted_on = '#{date}' && UPPER(title) = '#{title}'")
    @comment = Comment.new

    respond_to do |format|
      format.html { render :template => "site/post" }
      format.xml  { render :xml => @post.to_xml }
    end    
  end

  def comment
    @comment = Comment.new(params[:comment])
    @comment.post_id = params[:id]
    @comment.posted_on = Time.today

    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_url + @comment.post.url  }
        format.xml  { head :created, :location => comment_url(@comment) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors.to_xml }
      end
    end
  end

  private
  
  def get_ready
    @css = 'blog'
    @page = 'blog'
    @tags = Tag.find(:all)
    @links = Link.find(:all,:order => :position)   
    @posts = Post.find(:all,:order => "posted_on DESC")
  end 
  
end
