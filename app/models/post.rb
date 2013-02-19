class Post < ActiveRecord::Base
  attr_accessible :content, :intro, :status, :title
end
