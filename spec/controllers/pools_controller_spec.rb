require 'spec_helper'

describe PoolsController do
  before do
    @user = Factory(:user)
    sign_in @user
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    before do
      @pool = Factory(:pool, :owner => @user)
    end
    
    it "should be successful" do
      get 'show', { :id => @pool.id }
      response.should be_success
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "GET 'edit'" do
    before do
      @pool = Factory(:pool, :owner => @user)
    end
    
    it "should be successful" do
      get 'edit', { :id => @pool.id }
      response.should be_success
    end
  end

end
