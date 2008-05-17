module Merb
  module GlobalHelpers
    
    # Returns instance of the user while logged in.
    # 
    # Returns User:current_user
    # 
    def current_user
      User[:username => 'mtodd']
    end
    
  end
end
