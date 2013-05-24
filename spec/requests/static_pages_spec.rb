require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the h1 'Pale Fire'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Pale Fire')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Pale Fire | Home")
    end

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "Pale Fire | Help")
    end

  end

  describe "About page" do

    it "should have the content 'About Pale Fire'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Pale Fire')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "Pale Fire | About")
    end

  end




end
