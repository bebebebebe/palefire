class Stack < ActiveRecord::Base
  attr_accessible :project_id

  belongs_to :project, dependent: :destroy
  has_many :cards

  def multi?
    cards.size > 2
  end

end
