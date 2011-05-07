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
      response.should render_template("pools/index")
    end
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get 'show', { :id => @pool.id }
      response.should render_template("pools/show")
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should render_template("pools/new")
    end
  end
  
  describe "POST 'create'" do
    it "should create a new pool" do
      post 'create', :pool => { :name => 'foo', :description => 'bar', :picks => 10, :rule => Factory.attributes_for(:rule) }
      response.should render_template(:action => 'pools/show')
    end
  end
  
  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => @pool
      response.should render_template("pools/edit")
    end
  end
  
  describe "PUT 'update'" do
    it "should update a pool" do
      put 'update', :id => @pool, :pool => { :description => 'foo' }
      response.should render_template(:action => 'pools/show')
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should delete a pool" do
      delete 'destroy', :id => @pool
      response.should render_template(:action => 'pools/index')
    end
  end

end
