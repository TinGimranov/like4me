# coding: utf-8

class CabinetController < ApplicationController
	def index
		if !current_user
			redirect_to '/'
		end
		@meta_title = "Личный кабинет"

		if params[:act] == "get_likes"
			if request.post?
				vk = VkontakteApi::Client.new("00f2b7588a085818f090b8eed5eb5ae41b408f469e3a56d03ec43af3a34aaffc51c5a81f50cef960a0b03")
				@likes = vk.likes.is_liked(type: 'post', item_id: 1040, owner_id: -41412483, user_id: current_user.uid)
			end
			render :get_likes
		end
	end
end
