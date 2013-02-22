class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    "/admin" # <- Path you want to redirect the user to.
  end

  def after_sign_out_path_for(resource)
    "/admin" # <- Path you want to redirect the user to.
  end
  
 helper_method :current_user

private

def current_user
  @current_user ||= SiteUser.find(session[:user_id]) if session[:user_id]
end 

end
