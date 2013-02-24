class LikeOrder < ActiveRecord::Base
  attr_accessible :balance, :gender_max, :gender_min, :name, :sex, :url, :user_id

  validates :balance, :presence => true
  validates :name, :presence => true
  validates :url, :presence => true
end
