require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'Pale Fire'" do
      visit '/static_pages/home'
      page.should have_content('Pale Fire')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end
  end

  describe "About page" do

    it "should have the content 'About Pale Fire'" do
      visit '/static_pages/about'
      page.should have_content('About Pale Fire')
    end
  end

end
