class TextpagesController < ApplicationController
  # GET /textpages
  # GET /textpages.json

  
  layout "admin"

  before_filter :authenticate_user! 

  def index
    @textpages = Textpage.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /textpages/new
  # GET /textpages/new.json
  def new
    @textpage = Textpage.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /textpages/1/edit
  def edit
    @textpage = Textpage.find(params[:id])
  end

  # POST /textpages
  # POST /textpages.json
  def create
    @textpage = Textpage.new(params[:textpage])

    respond_to do |format|
      if @textpage.save
        format.html { redirect_to textpages_url }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /textpages/1
  # PUT /textpages/1.json
  def update
    @textpage = Textpage.find(params[:id])

    respond_to do |format|
      if @textpage.update_attributes(params[:textpage])
        format.html { redirect_to textpages_url  }
      else
        format.html { render action: "index" }
      end
    end
  end

  # DELETE /textpages/1
  # DELETE /textpages/1.json
  def destroy
    @textpage = Textpage.find(params[:id])
    @textpage.destroy

    respond_to do |format|
      format.html { redirect_to textpages_url }
      format.json { head :no_content }
    end
  end
end
