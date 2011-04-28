require 'spec_helper'

describe GhoulsController do
  before do
    @user = Factory(:user)
    sign_in @user
    @liz = Factory.build(:dead_ghoul)
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
