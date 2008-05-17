require 'digest/md5'

class User < Sequel::Model
  
  # = Associations
  one_to_many :posts
  
  # = Validations
  validates do
    presence_of :username
    presence_of :password
    presence_of :email
    presence_of :name
  end
  
  # = Hooks
  # ...
  
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
