# coding: utf-8

class CabinetController < ApplicationController
	def index
		if !current_user
			redirect_to '/'
		end
		@meta_title = "Личный кабинет"

		if params[:act] == "get_likes"
			render :get_likes
		end
	end
end
