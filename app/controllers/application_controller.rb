# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
   # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  protected
  def verify_super_user
    unless current_user.admin == 1
      redirect_to :back
      flash[:notice] ="You are not authorized to perform this action"
    end
  end
  
  def check_if_logged_in?
    unless logged_in?
      redirect_to :action => :new, :controller => 'sessions'
      flash[:notice] ="You need to log in first."
    end
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
