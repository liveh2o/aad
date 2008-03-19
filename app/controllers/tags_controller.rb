class TagsController < ApplicationController
  before_filter :initialize

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @tag.to_xml }
    end
  end
end