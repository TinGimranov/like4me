# coding: utf-8

class Feedback < ActiveRecord::Base
  attr_accessible :email, :question, :read

  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :question, :presence => true
end
