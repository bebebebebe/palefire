require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    before { visit root_path }

    it "should have the h1 'Pale Fire'" do
      page.should have_selector('h1', :text => 'Pale Fire')
    end

    it "should have the base title" do
      page.should have_selector('title',
                          :text => "Pale Fire")
    end

    it "should not have a custom page title" do
      page.should_not have_selector('title',
                        :text => "| Home")
    end

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title',
                        :text => "Pale Fire | Help")
    end

  end

  describe "About page" do

    it "should have the content 'About Pale Fire'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Pale Fire')
    end

    it "should have the title 'About'" do
      visit about_path
      page.should have_selector('title',
                        :text => "Pale Fire | About")
    end

  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: "Contact")
    end

    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title',
                        text: "Pale Fire | Contact")
    end
  end

end
