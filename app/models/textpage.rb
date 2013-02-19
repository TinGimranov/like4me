class Textpage < ActiveRecord::Base
  attr_accessible :content, :hidden, :slug, :title
end
