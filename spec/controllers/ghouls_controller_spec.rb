require 'spec_helper'

describe GhoulsController do
  before do
    @user = Factory(:user)
    sign_in @user
    @liz = Factory.build(:ghoul, :freebase_id => '/en/elizabeth_taylor')
    @liz.sync
    @liz.save
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get 'show', { :id => @liz.id }
      response.should render_template("ghouls/show")
    end
  end
end
