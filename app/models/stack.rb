class Stack < ActiveRecord::Base
  attr_accessible :project_id

  belongs_to :project
  has_many :cards, dependent: :destroy

  def multi?
    cards.size > 2
  end


  def next
    project.stacks.where("id > ?", id).order("id ASC").first
  end

  def prev
    project.stacks.where("id < ?", id).order("id DESC").first
  end

  def format_top_card
    text = cards.first.writing
    text.gsub('/n', '<p></p>')
    text += '&nbsp' if text != ''
    
  end


end
