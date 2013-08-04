class Position < ActiveRecord::Base
  attr_accessible :stack_id, :ord

  #belongs_to :stack
end
