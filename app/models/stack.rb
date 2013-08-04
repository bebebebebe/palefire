class Stack < ActiveRecord::Base
  attr_accessible :project_id, :position

  belongs_to :project
  has_many :cards, dependent: :destroy

  default_scope order: 'stacks.position ASC'

  def multi?
    cards.size > 2
  end

  def next
    #project.stacks.where("id > ?", id).order("id ASC").first
    array = project.stacks.select{|s| s.position == position + 1}
    array.first
  end

  def prev
    array = project.stacks.select {|stack| stack.position == position - 1}
    array.first
    #project.stacks.where("id < ?", id).order("id DESC").first
  end

  def format_top_card
    text = cards.first.writing
    if text && text != ''
      text.gsub('/n', '<p></p>')
      text += '&nbsp'
    end
  end


end
