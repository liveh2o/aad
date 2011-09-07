class ApplicationController < ActionController::Base
  before_filter :initialize

  protect_from_forgery

  private
    def initialize
      @css = action_name
      @page = action_name
    end
  
    def authorize
      redirect_to login_url unless session[:user_id]
    end
end
