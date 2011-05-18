require 'spec_helper'

describe "Ghouls" do
  before do
    @user = Factory(:user)
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
  end
  
  describe "SHOW /ghoul/{id}" do
    it "displays a ghoul" do
      @pool = Factory(:pool, :owner => @user)
      @entry = Factory(:entry, :pool => @pool)
      visit pool_entries_path(@pool)
      click_link @entry.ghoul.name
      page.should have_content(@entry.ghoul.name)
    end
  end
end
