require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Posts, "index action" do
  before(:each) do
    dispatch_to(Admin::Posts, :index)
  end
end