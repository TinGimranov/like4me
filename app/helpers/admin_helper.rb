module AdminHelper
	def get_settings_value(name)
	  	setting = Settings.find(:first, :conditions => { :name => name })
	  	return setting.value 
  	end
end
