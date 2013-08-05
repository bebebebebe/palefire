class Pick < ActiveRecord::Base
  attr_accessible :card_id, :stack_id

  belongs_to :stack

  validates :stack_id, presence: true

  validates :card_id, presence: true
end
