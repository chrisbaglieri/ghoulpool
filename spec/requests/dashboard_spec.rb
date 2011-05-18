require 'spec_helper'

describe "Dashboard" do
  before do
    @user = Factory(:user)
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
  end
  
  describe "GET /dashboard" do
    it "displays pools" do
      @pool = Factory(:pool, :owner => @user)
      visit dashboard_path
      page.should have_content(@pool.name)
    end
  end
end
