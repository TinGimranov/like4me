# coding: utf-8

class MainController < ApplicationController

  layout 'application'

  def index
      @meta_title = 'Главная'
  end

  def textpage

    @page = Textpage.find(:first, :conditions => { :slug => params[:slug] })
    if @page.nil?
      redirect_to '/404'
    else
      @meta_title = @page.title
    end

  end

  def faq
    @questions = Question.find(:all, :conditions => { :status => 0 })
    @meta_title = 'Вопрос - ответ'
  end

  def blog
    @meta_title = 'Блог'
    @posts = Post.find(:all, :conditions => { :status => 0 })
  end

  def blog_details
    @post = Post.find(:first, :conditions => { :status => 0, :id => params[:id] })
    @meta_title = @post.title+" — Блог"
  end

  def feedback

    @feedback = Feedback.new(params[:feedback])
    @a = 0;
    if request.post?
      if @feedback.save
        @a = 1
      end
    end
    @meta_title = 'Написать нам'

  end

end