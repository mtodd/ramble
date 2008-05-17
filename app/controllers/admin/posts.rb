module Admin
  class Posts < Application
    
    def index
      @posts = Post.order("created_at DESC").all
      render
    end
    
  end
end # Admin
