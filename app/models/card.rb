class Card < ActiveRecord::Base
  attr_accessible :stack_id, :writing

  #validates :writing, presence: true

  belongs_to :stack

  default_scope order: 'cards.created_at DESC'

end
