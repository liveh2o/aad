# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :initialize

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e34e3bfc91fdf47d1c79d8e9be700534'

  private
  
  def initialize
    @css = action_name
    @page = action_name
  end
  
  def authorize
    redirect_to login_url unless session[:user_id]
  end
  
end
