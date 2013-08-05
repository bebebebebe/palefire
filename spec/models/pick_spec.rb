require 'spec_helper'

describe Pick do

  let(:stack) { Stack.create }
  before { @pick = stack.build_pick }

  subject { @pick }

  it { should respond_to(:stack_id) }
  it { should respond_to(:card_id) }

  it { should be_valid }

  describe "when stack_id not present" do
    before { @pick.stack_id = nil }
    it { should_not be_valid }
  end

  describe "when card_id not present" do
    before { @pick.card_id = nil }
    it { should_not be_valid }
  end

end