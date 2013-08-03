require 'spec_helper'

describe Plot do
  
  let(:project) { FactoryGirl.create(:project) }
  before { @plot = project.plots.build(pick: true) }

  describe "when project_id is not present" do
    before { @plot.project_id = nil }
    it { should_not be_valid }
  end

  subject { @plot }

  it { should respond_to(:pick) }
  it { should respond_to(:project_id) }
  it { should respond_to(:project) }
  its(:project) { should eq project }

  it { should be_valid }

  describe "when project_id is not preset" do
    before { @plot.project_id = nil }
    it { should_not be_valid }
  end

end
