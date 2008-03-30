class AdminController < ApplicationController
  def index
    redirect_to admin_posts_url
  end
end