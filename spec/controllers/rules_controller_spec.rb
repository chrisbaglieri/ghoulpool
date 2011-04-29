require 'spec_helper'

describe RulesController do
  before do
    @user = Factory(:user)
    sign_in @user
    @pool = Factory(:pool, :owner => @user)
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new', :pool_id => @pool.id
      response.should render_template("rules/new")
    end
  end
  
  describe "POST 'create'" do
    it "should create a new rule" do
      post 'create', :pool_id => @pool.id, :rule => Factory.attributes_for(:rule)
      response.should render_template(:action => 'pools/show')
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should delete an entry" do
      @rule = Factory(:rule, :pool => @pool)
      delete 'destroy', :pool_id => @pool.id, :id => @rule
      response.should render_template(:action => 'pools/show')
    end
  end
end
