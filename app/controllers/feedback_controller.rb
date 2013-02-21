class FeedbackController < ApplicationController

  layout "admin"

  before_filter :authenticate_user!

  def index
    @feedback = Feedback.find(:all, :order => "`read`, `id` DESC" )

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
    @feedback.update_attribute(:read, 1)
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to '/admin/feedback' }
    end
  end
end
