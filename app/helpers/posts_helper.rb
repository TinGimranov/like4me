module PostsHelper
  def get_last_posts
    @posts = Post.find(:all, :conditions => { :status => 0 }, :limit => 3 )
    return @posts
  end

  def get_last_posts_admin
    @posts = Post.find(:all, :conditions => { :status => 0 }, :limit => 10 )
    return @posts
  end
end
