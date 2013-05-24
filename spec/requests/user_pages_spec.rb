require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit try_path }

    it { should have_selector('h1',    text: 'try Pale Fire') }
    it { should have_selector('title', text: 'Pale Fire | try') }
  end
end

