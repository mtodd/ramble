require File.join( File.dirname(__FILE__), "..", "spec_helper" )

SAMPLE_USERS = [
  ['test', 'test', 'a@b.c'],
  ['maraby', 'password', 'm@b.c']
]

describe User do
  
  before do
    # Remove all users
    User.delete
    
    # Create sample users
    SAMPLE_USERS.each do |(un, pw, email)|
      pw = Digest::MD5.hexdigest(pw)
      User.new(:username => un, :password => pw, :email => email).save
    end
  end
  
  it "should be valid when new" do
    user = User.new
    user.should be_valid
  end
  
  it "should authenticate saved users in the database" do
    User.authenticate("test","test").should be_true
  end
  
  it "should fail to authenticate users not stored in the database" do
    User.authenticate("nonexistent", "user_and_password").should be_false
  end
  
end
