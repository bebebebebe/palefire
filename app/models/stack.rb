class Stack < ActiveRecord::Base
  attr_accessible :project_id

  belongs_to :project
  has_many :cards, dependent: :destroy

  def multi?
    cards.size > 2
  end

end
