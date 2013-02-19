module MenuHelper
	def is_current(cur_controller, cur_action, addition_condition)
	    if controller.controller_name == cur_controller && controller.action_name == cur_action && (addition_condition == nil || addition_condition.to_s == params[:id].to_s)
	        return 'active'
	    end
  end

  def is_current_textpage(cur_controller, cur_action, addition_condition)
    if controller.controller_name == cur_controller && controller.action_name == cur_action && (addition_condition == nil || addition_condition.to_s == params[:slug].to_s)
      return 'active'
    end
  end
end
