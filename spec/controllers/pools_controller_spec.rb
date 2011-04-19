require 'spec_helper'

describe PoolsController do
  before do
    @user = Factory(:user)
    sign_in @user
    @pool = Factory(:pool, :owner => @user)
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
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
  
  describe "POST 'create'" do
    it "should create a new pool" do
      post 'create', Factory.attributes_for(:pool, :user_id => @user.id)
      response.should be_success
    end
  end
  
  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => @pool
      response.should be_success
    end
  end
  
  describe "PUT 'update'" do
    it "should update a pool" do
      put 'update', :id => @pool
      response.should redirect_to(:action => 'show')
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should delete a pool" do
      delete 'destroy', :id => @pool
      response.should redirect_to(:action => 'index')
    end
  end

end
