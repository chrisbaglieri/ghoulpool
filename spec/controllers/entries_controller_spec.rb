require 'spec_helper'

describe EntriesController do
  before do
    @user = Factory(:user)
    sign_in @user
    @pool = Factory(:pool, :owner => @user)
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index', :pool_id => @pool.id
      response.should render_template("entries/index")
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new', :pool_id => @pool.id
      response.should render_template("entries/new")
    end
  end
  
  describe "POST 'create'" do
    it "should create a new entry for a ghoul that's alive" do
      post 'create', :pool_id => @pool.id, :entry => { :ghoul_attributes => Factory.attributes_for(:living_ghoul) }
      response.should render_template(:action => 'pools/show')
    end
    
    it "should not create a new entry for a ghoul that's dead" do
      post 'create', :pool_id => @pool.id, :entry => { :ghoul_attributes => Factory.attributes_for(:dead_ghoul) }
      response.should render_template(:action => 'pools/new')
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should delete an entry" do
      @entry = Factory(:entry, :owner => @user, :pool => @pool)
      delete 'destroy', :pool_id => @pool.id, :id => @entry
      response.should render_template(:action => 'pools/show')
    end
  end

end
