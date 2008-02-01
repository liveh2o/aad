# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :initialize
  
  private
  
  def initialize
    @css = action_name
    @page = action_name
  end
end
