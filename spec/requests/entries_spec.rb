require 'spec_helper'

describe "Entries" do
  before do
    @user = Factory(:user)
    @pool = Factory(:pool, :owner => @user)
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
  end
  
  describe "GET /entries" do
    it "gets a pool's entries" do
      @entry = Factory(:entry, :owner => @user, :pool => @pool)
      visit "/dashboard"
      click_link "Entries"
      page.should have_content(@entry.ghoul.name)
    end
  end
  
  describe "POST /pool/{id}/entries" do
    it "creates an entry" do
      visit new_pool_entry_path(@pool)
      fill_in "Name", :with => "Barack Obama"
      click_button "Search"
      click_button "Create Entry"
      page.should have_content("Entry was successfully created.")
    end
  end
  
  describe "DELETE /pool/{id}/entry" do
    it "deletes an entry" do
      @entry = Factory(:entry, :owner => @user, :pool => @pool)
      visit pool_entries_path(@pool)
      click_link "Delete"
      page.should have_content("Entry was successfully deleted.")
    end
  end
end
