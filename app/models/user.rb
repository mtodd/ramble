require 'digest/md5'

class User < Sequel::Model
  
  set_primary_key :username
  
  class << self
    
    # Authenticates a user against the username and password stored in the
    # database.
    #   +username+
    #   +password+
    # 
    # Examples
    #   User.authenticate("real_user", "correct") #=> true
    #   User.authenticate("faker", "wrong") #=> false
    # 
    # Returns true|false:authenticated?
    # 
    def authenticate(username, password)
      !self[:username => username, :password => Digest::MD5.hexdigest(password)].nil?
    end
    
  end
  
end
