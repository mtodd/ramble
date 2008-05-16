require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Users, "#index" do
  
  it "should respond correctly" do
    dispatch_to(Users, :index).should respond_successfully
  end
  
end
