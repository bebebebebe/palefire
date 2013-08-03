require 'spec_helper'

describe Arrangement do

  before do
    @arrangement = Arrangement.new
  end
 
  subject { @arrangement }

  it { should respond_to(:plot_id) }
  it { should respond_to(:stack_id) }
  it { should respond_to(:position) }

  it { should be_valid }

end
