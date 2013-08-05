class Stack < ActiveRecord::Base
  attr_accessible :project_id, :position

  belongs_to :project
  has_many :cards, dependent: :destroy

  default_scope order: 'stacks.position ASC'

  def multi?
    cards.size > 2
  end

  def next
    project.stacks.where("position > ?", position).first
  end

  def prev
    project.stacks.where("position < ?", position).last
  end

  def inc_following
    stacks = project.stacks.where("position >= ?", position)
    stacks.each do |stack|
      if stack != self
        stack.position += 1
        stack.save
      end
    end
  end

  def format_top_card
    text = cards.first.writing
    if text && text != ''
      text.gsub('/n', '<p></p>')
      text += '&nbsp'
    end
  end

end
