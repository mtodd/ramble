require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Post do
  
  it "should be valid when new" do
    post = Post.new
    post.should be_valid
  end
  
  it "should properly format slugs from titles" do
    post = Post.new
    post.id = 12
    post.title = "Hello, world!"
    post.slug.should == "12-hello-world"
  end
  
end
