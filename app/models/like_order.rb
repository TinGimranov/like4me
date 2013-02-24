class LikeOrder < ActiveRecord::Base
  attr_accessible :balance, :gender_max, :gender_min, :name, :sex, :url, :item_id, :owner_id, :type_record, :user_id

  validates :balance, :presence => true,
  					  :numericality => { :only_integer => true, :greater_than => 0 }

  validates :name, :presence => true,
  				   :uniqueness => true
  validates :url, :presence => true,
  				  :format => { :with => /^http:\/\/vk\.com\/.*[-0-9]+_[0-9]+.*$/i },
  				  :uniqueness => true
end
