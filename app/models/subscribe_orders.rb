class SubscribeOrders < ActiveRecord::Base
  attr_accessible :balance, :bonus, :gid, :name, :url, :user_id
  
  validates :balance, :presence => true,
  					  :numericality => { :only_integer => true, :greater_than => 0 }					  
  validates :bonus, :presence => true,
              :numericality => { :only_integer => true, :greater_than => 2 }
  validates :name, :presence => true,
              :uniqueness => true
  validates :url, :presence => true,
              :format => { :with => /^http:\/\/vk\.com\/.*$/i },
              :uniqueness => true
end
