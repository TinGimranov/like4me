module TextpagesHelper
  def get_textpages_list
    @textpages = Textpage.find(:all)
    return @textpages
  end

  def get_available_text_page
    @textpages = Textpage.find(:all, :conditions => { :hidden => 0 })
    return @textpages
  end
end
