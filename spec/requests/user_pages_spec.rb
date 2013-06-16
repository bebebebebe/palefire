require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit try_path }

    it { should have_selector('h1',    text: 'try Pale Fire') }
    it { should have_selector('title', text: 'Pale Fire | try') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',     text: user.name) }
    it { should have_selector('title',  text: user.name) }
  end

  describe "try" do

    before { visit try_path }

    let(:submit) { "create account" }

    describe "with invalid infomration" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "name:",         with: "Example User"
        fill_in "email:",        with: "user@example.com"
        fill_in "choose a password:",     with: "foobar"
        fill_in "confirm password:", with: "foobar"
      end


      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'welcome') }
        it { should have_link('Sign out') }
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    describe "page" do 
      it { should have_selector('h1', text: "update your profile") }
      it { should have_selector('title', text: "edit user") }
      it { should have_link('change picture', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "save changes" }

      it { should have_content('error') }
    end
  end  
end

