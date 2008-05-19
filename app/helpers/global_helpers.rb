module Merb
  module GlobalHelpers
    
    # Parse test through RedCloth to generate HTML from textile text.
    # 
    # Returns String:textilize_to_html
    # 
    def textilize(text)
      RedCloth.new(text).to_html
    end
    
    # Returns instance of the user while logged in.
    # 
    # Returns User:current_user
    # 
    def current_user
      @current_user
    end
    
    # Administrative functionality and test.
    # Can be used to block administrative functions or to test for
    # administrative privilege.
    # 
    # Returns true|false:authenticated_user
    # 
    def admin
      if block_given?
        yield unless current_user.nil?
      else
        !current_user.nil?
      end
    end
    
  end
end
