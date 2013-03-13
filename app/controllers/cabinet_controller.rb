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
		if params[:act] == "get_subscribers"
		  @subscribe_orders = SubscribeOrders.new(params[:subscribe_orders])
		  if request.post?
		    if @subscribe_orders.valid?
		      if params[:subscribe_orders][:url].scan(/^http:\/\/vk.com\/club[0-9]+$/i).size > 0 || params[:subscribe_orders][:url].scan(/^http:\/\/vk.com\/public[0-9]+$/i).size > 0
		        gid = params[:subscribe_orders][:url].scan(/[0-9]+$/i)
		      elsif params[:subscribe_orders][:url].scan(/^http:\/\/vk.com\/[0-9A-Za-z.-_]+$/i).size > 0
		        gid = params[:subscribe_orders][:url].split("/")[3]        
	        else
	          @subscribe_orders.errors.add(:url, "не удаётся прочитать информацию о группе")
	          render :get_subscribers
	          return
	        end
          RestClient.get(params[:subscribe_orders][:url]) { |response, request, result, &block|
					  case response.code
					  when 404
					      @subscribe_orders.errors.add(:url, "который вы ввели недоступен")
					  else
					    vk = VkontakteApi::Client.new(get_settings_value('access_token'))
          	  group_info = vk.groups.getById(gid: gid)

    	        if group_info[0].is_closed.to_i != 0
    	          @subscribe_orders.errors.add(:url, "группа закрыта настройками приватности")
    	          render :get_subscribers
    	          return
    	        else
                if params[:subscribe_orders][:balance].to_i*params[:subscribe_orders][:bonus].to_i > current_user.balance.to_i
					  			@subscribe_orders.errors.add(:balance, "умноженное на цену подписчика не может быть запрошено больше чем лайков на вашем балансе")
					  			render :get_subscribers
					  			return	
					  		end
					  		@subscribe_orders.gid = group_info[0].gid
					  		@subscribe_orders.user_id = current_user.id
					  		if @subscribe_orders.save
				  				@site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
				  				@site_user.update_attributes(:balance => current_user.balance.to_i - (params[:subscribe_orders][:balance].to_i*params[:subscribe_orders][:bonus].to_i))
				  			end
				  			@notice_seccess = 1
    	        end
					  end
				  }
		    end
		  end
		  render :get_subscribers
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
	
	def subscribe_group
		orders = SubscribeOrders.find(:all, 
				:conditions => ["balance > ? AND user_id <> ?", 0, current_user.id],
				:order => "RAND()"
		)
		orders.each do |item|
				vk = VkontakteApi::Client.new(get_settings_value('access_token'))
				is_member = vk.groups.isMember(gid: item.gid, user_id: current_user.uid)
				if is_member.to_i == 0
					render :text => item.url
					return
				end
		end
		render :text => 0
		return
	end
	
	def check_subscribe
		if params[:url]
			item = SubscribeOrders.find(:first, :conditions => { :url => params[:url] })
			if item && item != nil
				if item.balance.to_i != 0
					vk = VkontakteApi::Client.new(get_settings_value('access_token'))
					is_member = vk.groups.isMember(gid: item.gid, user_id: current_user.uid)
					if is_member.to_i == 1
						item.update_attributes(:balance => item.balance.to_i - 1)
						site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
						site_user.update_attributes(:balance => current_user.balance.to_i + item.bonus.to_i)
						render :json => {error_code: 0, bonus: item.bonus}
						return
					else
						render :json => {error_code: 4} #Вы не лайкнули пост
						return
					end
				else
					render :json => {error_code: 3} #Баланс уже равен нулю
					return;	
				end
			else
				render :json => {error_code: 2} #Заказа не найдено
				return	
			end

		else
			render :json => {error_code: 1} #Пришёл пустой параметр
			return
		end
	end
	
	def orders
	  if !current_user
 			redirect_to '/'
 		end
 		if request.delete?
 		  like = LikeOrder.find(:first, :conditions => { :id => params[:param_name] })
 		  if like && like.user_id == current_user.id && params[:param_type] == 'like'
 		      current_balance = like.balance
 		      balance_to_restore = like.balance
 		      if like.sex.to_i != 0
 		        balance_to_restore = balance_to_restore.to_i + current_balance.to_i
 		      end
 		      if like.gender_min.to_i != 0 || like.gender_max.to_i != 0
 		         balance_to_restore = balance_to_restore.to_i + current_balance.to_i
 		      end
 		      site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
					site_user.update_attributes(:balance => current_user.balance.to_i + balance_to_restore.to_i)
 		      like.delete
          redirect_to '/cabinet/orders'
 		  end
 		  subscribe = SubscribeOrders.find(:first, :conditions => { :id => params[:param_name] })
 		  if subscribe && subscribe.user_id == current_user.id && params[:param_type] == 'subscribe'
 		      restore_balance_value = subscribe.balance.to_i*subscribe.bonus.to_i
 		      site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
					site_user.update_attributes(:balance => current_user.balance.to_i + restore_balance_value.to_i)
 		      subscribe.delete
 		      redirect_to '/cabinet/orders'
 		  end
 		end
 		@meta_title = "История заказов - Личный кабинет"
 		@like_orders = LikeOrder.find(:all, :conditions => {:user_id => current_user.id })
 		@subscribers = SubscribeOrders.find(:all, :conditions => {:user_id => current_user.id })
	end

	def update_balance
	  if params[:type] != 'like' && params[:type] != 'subscribe'
    	    render :json => '{ "error":"5" }'
    	    return
	  end
    if params[:id] == '' || params[:id].to_i.to_s != params[:id]
        render :json => '{ "error":"5" }'
  	    return
    end
    
    if params[:balance] == '' 
        render :json => '{ "error":"4" }'
  	    return
    end
    
    if params[:balance].to_i.to_s != params[:balance]
        render :json => '{ "error":"3" }'
  	    return
    end
   
   if params['type'] == 'like'
        order = LikeOrder.find(:first, :conditions => { :id => params[:id].to_i })
        if !order
          render :json => '{ "error":"2" }'
    	    return 
    	  end
    	  new_balance = params[:balance].to_i
    	  if order.sex.to_i != 0
    	    new_balance = new_balance.to_i + params[:balance].to_i
    	  end 
    	  if order.gender_min.to_i != 0 || order.gender_max.to_i != 0
    	    new_balance = new_balance.to_i + params[:balance].to_i
    	  end
    	  if new_balance.to_i > current_user.balance.to_i
    	    render :json => '{ "error":"1" }'
      	  return
    	  end
    	  order.update_attributes(:balance => order.balance.to_i + params[:balance].to_i)
    	  site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
				site_user.update_attributes(:balance => current_user.balance.to_i - new_balance.to_i)
				render :json => '{ "error":"0" }'
     	  return
   end 
   
   if params[:type] == 'subscribe'
       order = SubscribeOrders.find(:first, :conditions => { :id => params[:id].to_i })
       if !order
         render :json => '{ "error":"2" }'
   	     return 
   	  end
   	  new_balance = params[:balance].to_i * order.bonus.to_i
   	  if new_balance.to_i > current_user.balance.to_i
   	    render :json => '{ "error":"1" }'
     	  return
   	  end
   	  order.update_attributes(:balance => order.balance.to_i + params[:balance].to_i)
   	  site_user = SiteUser.find(:first, :conditions => {:id => current_user.id })
  		site_user.update_attributes(:balance => current_user.balance.to_i - new_balance.to_i)
  		render :json => '{ "error":"0" }'
   	  return
   end
    
  end
end
