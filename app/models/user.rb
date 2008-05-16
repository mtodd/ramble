require 'digest/md5'

class User < Sequel::Model
  
  class << self
    
    def authenticate(username, password)
      !self[:username => username, :password => Digest::MD5.hexdigest(password)].empty?
    end
    
  end
  
end
