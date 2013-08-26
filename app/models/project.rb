class Project < ActiveRecord::Base
  attr_accessible :title, :description_short, :description_long

  belongs_to :user
  has_many :stacks

  has_many :cards, through: :stacks,  dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true


  default_scope order: 'projects.updated_at ASC'

  def num_stacks
    stacks.count
  end

  def draft
    text = ''
    stacks.each do |stack|
      text += stack.picked_card.writing + ' '
    end
    text
  end

  def updated
    cards.first.updated_at
  end

end
