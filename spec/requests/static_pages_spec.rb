require 'spec_helper'

describe 'Static pages' do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end

  describe "Help page" do

    it "should have the content 'help'" do
      visit '/static_pages/help'
      page.should have_content("Help")
    end
  end

  describe "About page" do

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
  end

  it "Should have the right title" do
    visit '/static_pages/about'
    page.should have_selector('title', text: "About Us")
  end

  describe "Contact Page" do

    it "Should have content 'Contact Us'" do
    visit '/static_pages/contact'
    page.should have_selector('title', text: "Contact")
  end
end
end