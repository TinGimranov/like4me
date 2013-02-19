class AdminController < ApplicationController
  #protect_from_forgery 	

  layout "admin"

  before_filter :authenticate_user!	
  def index
  	redirect_to '/admin/settings'
  end

  def settings
  	if request.delete?
  		Settings.find(:first, :conditions => { :name => params[:param_name]}).delete
  		redirect_to '/admin/settings'
  	end

  	if request.put? or params[:param_name]
  		@settings = Settings.find(:first, :conditions => { :name => params[:param_name]})
  	else
  		@settings = Settings.new(params[:settings])
  	end
  	
  	if request.post? and params[:param_name]
  		@settings.update_attributes(params[:settings])
  		redirect_to '/admin/settings'
  	elsif request.post? and !params[:param_name]
  		@settings.save
  		redirect_to '/admin/settings'
  	end

  	@_settings = Settings.find(:all)
  end

end
