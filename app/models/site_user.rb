class SiteUser < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :balance, :sex, :birthday

def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
    user.balance = 10
    if defined?(auth["extra"]["raw_info"]["sex"]) && auth["extra"]["raw_info"]["sex"]
    	user.sex = auth["extra"]["raw_info"]["sex"].to_i
    end
    if defined?(auth["extra"]["raw_info"]["bdate"]) && auth["extra"]["raw_info"]["bdate"] && auth["extra"]["raw_info"]["bdate"].scan(/[0-9]+\.[0-9]+\.[0-9]{4}/i)
    	user.birthday = auth["extra"]["raw_info"]["bdate"]	
    end 
  end
end
end
