require 'spec_helper'

describe "Pools" do
  before do
    @user = Factory(:user)
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
  end
  
  describe "SHOW /pool/{id}" do
    it "displays a pool" do
      @pool = Factory(:pool, :owner => @user)
      visit pool_path(@pool)
      page.should have_content(@pool.name)
    end
  end
  
  describe "POST /pool" do
    it "creates a pool" do
      @pool = Factory.build(:pool, :owner => @user)
      visit new_pool_path
      fill_in "Name", :with => @pool.name
      fill_in "Description", :with => @pool.description
      fill_in "Picks", :with => @pool.picks
      fill_in "Function", :with => @pool.rule.function
      click_button "Create Pool"
      page.should have_content("Pool was successfully created.")
    end
  end
  
  describe "PUT /pool" do
    it "updates a pool" do
      @pool = Factory(:pool, :owner => @user)
      visit edit_pool_path(@pool)
      fill_in "Name", :with => "foo"
      fill_in "Description", :with => "bar"
      fill_in "Picks", :with => @pool.picks
      fill_in "Name", :with => @pool.name
      fill_in "Function", :with => @pool.rule.function
      click_button "Update Pool"
      page.should have_content("Pool was successfully updated.")
    end
  end
  
  describe "DELETE /pool" do
    it "deletes a pool" do
      @pool = Factory(:pool, :owner => @user)
      visit "/dashboard"
      click_link "Delete"
      page.should have_content("Pool was successfully deleted.")
    end
  end
end
