class Comment
  
  class << self
    
    def disqus_account
      Merb.config[:disqus]
    end
    
  end
  
end
