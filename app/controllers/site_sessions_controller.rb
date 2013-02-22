class SiteSessionsController < ApplicationController
	def create
  auth = request.env["omniauth.auth"]
  user = SiteUser.find(:first, :conditions => { :provider => auth["provider"], :uid => auth["uid"] }) || SiteUser.create_with_omniauth(auth)
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Signed out!"
end
end
