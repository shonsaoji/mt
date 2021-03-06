# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # render new.rhtml
  def new    
  end

  def create
    user = User.authenticate(params[:user_name], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      if user.admin == 1
        redirect_to :action => :home, :controller => :users, :id => self.current_user.id
        flash[:notice] = "Logged in successfully"
      else
        # redirect according to the type of the account
      end
      
    else
      flash[:error] = "Failed to Log in"
      @user_name       = params[:user_name]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:user_name]}'"
    logger.warn "Failed login for '#{params[:user_name]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
