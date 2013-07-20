class Card < ActiveRecord::Base
  attr_accessible :stack_id, :writing

  belongs_to :stack, dependent: :destroy

  default_scope order: 'cards.created_at DESC'
end
