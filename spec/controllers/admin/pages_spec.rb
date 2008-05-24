require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Pages, "index action" do
  before(:each) do
    dispatch_to(Admin::Pages, :index)
  end
end