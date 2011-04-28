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
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should render_template("ghouls/new")
    end
  end
  
  describe "POST 'create'" do
    it "should create a new ghoul" do
      post 'create', :ghoul => Factory.attributes_for(:ghoul, :freebase_id => "/en/charlie_sheen")
      response.should render_template(:action => 'ghouls/show')
    end
    
    it "should not create a fake ghoul" do
      post 'create', :ghoul => Factory.attributes_for(:ghoul, :freebase_id => "/en/charlie_sheeno")
      response.should be_success
      response.should render_template("ghouls/new")
    end
  end
end
