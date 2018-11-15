class ApplicationController < ActionController::Base
  
  helper_method :current_user
  
  def login!(user)
    #????
    self.session[:session_token] = user.reset_session_token!
  end
  
  def current_user
    @current_user ||= User.find_by(session_token: self.session[:session_token])
  end
  
  
  def logout!
    session[:session_token] = nil
  end
  
end
