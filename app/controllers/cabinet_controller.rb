# coding: utf-8
require 'rest-client'

class CabinetController < ApplicationController

	include AdminHelper  

	def index
		if !current_user
			redirect_to '/'
		end
		@meta_title = "Личный кабинет"

		if params[:act] == "get_likes"
			@like_order = LikeOrder.new(params[:like_order])
			if request.post?
				if @like_order.valid?
					RestClient.get(params[:like_order][:url]) { |response, request, result, &block|
					  case response.code
					  when 404
					      @like_order.errors.add(:url, "который вы ввели недоступен")
					  else
					  	response = RestClient.get(params[:like_order][:url])
					  	if response.scan(/<title>Ошибка<\/title>/i).size > 0
					  		@like_order.errors.add(:url, "который вы ввели запрещён для общего доступа настройками приватности")
					  	else
					  		owner_item_id = params[:like_order][:url].scan(/[-0-9]+_[0-9]+/i)[0].split("_")
					  		balance = params[:like_order][:balance]

					  		if params[:like_order][:sex].to_i != 0
					  			balance = balance.to_i + params[:like_order][:balance].to_i
					  		end


					  		if params[:like_order][:gender_min].to_i != 0 || params[:like_order][:gender_max].to_i != 0
					  			balance = balance.to_i + params[:like_order][:balance].to_i
					  		end
					  		if balance.to_i > current_user.balance.to_i
					  			@like_order.errors.add(:balance, "не может быть больше чем лайков на вашем балансе")	
					  		else
					  			if params[:like_order][:url].scan(/wall[-0-9]+_[0-9]+/i).size > 0
					  				@like_order.type_record = 'post'
					  			end

					  			if params[:like_order][:url].scan(/photo[-0-9]+_[0-9]+/i).size > 0
					  				@like_order.type_record = 'photo'
					  			end

					  			if params[:like_order][:url].scan(/video[-0-9]+_[0-9]+/i).size > 0
					  				@like_order.type_record = 'video'
					  			end

					  			if @like_order.type_record == nil
					  				@like_order.errors.add(:url, "не удаётся установить тип страницы")
					  			else
						  			@like_order.owner_id = owner_item_id[0]
						  			@like_order.item_id = owner_item_id[1]
						  			@like_order.user_id = current_user.id
						  			if @like_order.save
						  				@site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
						  				@site_user.update_attributes(:balance => current_user.balance.to_i - balance.to_i)
						  			end
						  			@notice_seccess = 1
						  		end
					  		end
					  	end
					  end
					}
				end
			end
			render :get_likes
		end
	end

	def like_post
		orders = LikeOrder.find(:all, 
				:conditions => ["balance > ? AND user_id <> ?", 0, current_user.id],
				:order => "RAND()"
		)
		orders.each do |item|
			if item.sex.to_i == 0 || item.sex.to_i == current_user.sex.to_i
				if item.gender_min.to_i == 0 || (current_user.birthday != nil && (((Date.today-Date.parse(current_user.birthday.to_s)).to_i)/365).to_i >= item.gender_min.to_i) 
					if item.gender_max.to_i == 0 || (current_user.birthday != nil && (((Date.today-Date.parse(current_user.birthday.to_s)).to_i)/365).to_i <= item.gender_max.to_i) 
						vk = VkontakteApi::Client.new(get_settings_value('access_token'))
						liked = vk.likes.is_liked(owner_id: item.owner_id, item_id: item.item_id, type: item.type_record, user_id: current_user.uid)
						if liked.to_i == 0
							render :text => item.url
							return
						end
					end	
				end
			end
		end
		render :text => 0
		return
	end

	def check_like
		if params[:url]
			item = LikeOrder.find(:first, :conditions => { :url => params[:url] })
			if item && item != nil
				if item.balance.to_i != 0
					vk = VkontakteApi::Client.new(get_settings_value('access_token'))
					liked = vk.likes.is_liked(owner_id: item.owner_id, item_id: item.item_id, type: item.type_record, user_id: current_user.uid)
					if liked.to_i == 1
						item.update_attributes(:balance => item.balance.to_i - 1)
						site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
						site_user.update_attributes(:balance => current_user.balance.to_i + 1)
						render :text => 0
						return
					else
						render :text => 4 #Вы не лайкнули пост
						return
					end
				else
					render :text => 3 #Баланс уже равен нулю
					return;	
				end
			else
				render :text => 2 #Заказа не найдено
				return	
			end

		else
			render :text => 1 #Пришёл пустой параметр
			return
		end
	end
end
