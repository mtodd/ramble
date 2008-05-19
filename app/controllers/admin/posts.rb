module Admin
  
  # Just a wrapper for posts, but with authentication.
  # 
  class Posts < ::Posts
    
    # before :authenticated?, :exclude => []
    
  end
  
end # Admin
