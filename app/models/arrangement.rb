class Arrangement < ActiveRecord::Base
  attr_accessible :plot_id, :position, :stack_id

  belongs_to :plot
  belongs_to :stack

end
