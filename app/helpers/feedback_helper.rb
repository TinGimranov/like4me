module FeedbackHelper
	def get_count_unread_message
		return Feedback.count(:all, :conditions => { :read => 0 })
	end

	def get_last_messages
		return Feedback.find(:all, :conditions => { :read => 0 })
	end
end
