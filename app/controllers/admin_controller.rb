class AdminController < ApplicationController
  # Set the layout
  layout 'login'

  def index
    redirect_to admin_posts_url
  end
  
  def login
    session[:user_id] = nil
    if request.post?
      if params[:post][:username] == "arthur"
        session[:user_id] = 1 unless params[:password] == "rockthecasbah"
        redirect_to admin_posts_url
      else
        flash[:notice] = "Could not log you in!"
      end
    end
  end

  def logout
    reset_session
    redirect_to :action => :login
  end
end