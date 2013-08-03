require 'spec_helper'

describe Project do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    @project = user.projects.build(title: "MyTitle")
  end

  subject { @project }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should respond_to(:plots) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Project.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

  end

  describe "plot associations" do

    before do 
      @project.save
      @project.plots.create
    end

    it "should destroy associated plots" do
      plots = @project.plots.to_a
      @project.destroy
      expect(plots).not_to be_empty
      plots.each do |plot|
        expect(Plot.where(id: plot.id)).to be_empty
      end 
    end
  end

end


# let(:project) { FactoryGirl.create(:project) }


# it "should destroy associated microposts" do
#       microposts = @user.microposts.to_a
#       @user.destroy
#       expect(microposts).not_to be_empty
#       microposts.each do |micropost|
#         expect(Micropost.where(id: micropost.id)).to be_empty
#       end
#     end


