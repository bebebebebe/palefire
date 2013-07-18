class Project < ActiveRecord::Base
  attr_accessible :title

  validates :user_id, presence: true

  belongs_to :user, dependent: :destroy
  has_many :stacks

  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true

  default_scope order: 'projects.created_at DESC'

  def num_stacks
    stacks.count
  end

  def last_card_time
  end

private

  def cards
    cards = []
    stacks.each do |stack|
      cards += stack.cards
    end
    cards
  end

end
