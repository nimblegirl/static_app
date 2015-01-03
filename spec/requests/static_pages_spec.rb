require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the title 'App | Home'" do
      visit '/static_pages/home'
      expect(page).to have_title('App | Home')
    end
  end
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'App | Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('App | Help')
    end

  end
  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'App | About'" do
      visit '/static_pages/about'
      expect(page).to have_title('App | About')
    end

  end

end