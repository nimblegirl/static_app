require 'spec_helper'

describe "Static pages" do

	describe "Home page" do

	    it "should have the content 'Home'" do
	      visit '/'
	      expect(page).to have_content('Home')
	    end

	    it "should have the title 'App'" do
	      visit '/'
	      expect(page).to have_title('App')
	    end

	    it "should have the title '| Home'" do
	      visit '/'
	      expect(page).not_to have_title('| Home')
	    end

	    describe "for signed-in users" do
	      let(:user) { FactoryGirl.create(:user) }
	      before do
	        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
	        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
	        sign_in user
	        visit root_path
	      end

	      it "should render the user's feed" do
	        user.feed.each do |item|
	          expect(page).to have_selector("li##{item.id}", text: item.content)
	        end
	      end
   		end
  	end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'App | Help'" do
      visit '/help'
      expect(page).to have_title('App | Help')
    end

  end
  
  describe "About page" do
    it "should have the content 'About'" do
      visit '/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'App | About'" do
      visit '/about'
      expect(page).to have_title('App | About')
    end

  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit '/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the title 'App | Contact'" do
      visit '/contact'
      expect(page).to have_title('App | Contact')
    end

  end
end