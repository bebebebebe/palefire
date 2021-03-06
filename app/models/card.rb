class Card < ActiveRecord::Base
  attr_accessible :stack_id, :writing

  #validates :writing, presence: true

  belongs_to :stack

  default_scope order: 'cards.created_at DESC'


  def diff_from_pick
    v = Versions.new(original, revised)
    v.diff(v.longest_common_subseq).join(' ')
  end

  def original
    stack.picked_card.writing.split(' ')
  end

  def revised
    writing.split(' ')
  end

end


class Versions
  attr_accessor :original, :revised
  #   original, revised are arrays.

  def initialize(original, revised)
    @original = original
    @revised = revised
  end

  def longest_common_subseq(i=0, j=0, memo={})
    if memo.has_key?([original, revised, i, j])
      return memo[[original, revised, i, j]]
    elsif original.empty? || revised.empty?
      return []
    elsif original.first == revised.first
      [[i, j]] + 
        Versions.new(original.drop(1), revised.drop(1)).longest_common_subseq(i+1, j+1, memo)
    else
      seq1 = memo[[original.drop(1), revised, i+1, j]] = 
        Versions.new(original.drop(1), revised).longest_common_subseq(i+1, j, memo)
      seq2 = memo[[original, revised.drop(1), i, j+1]] =
        Versions.new(original, revised.drop(1)).longest_common_subseq(i, j+1, memo)
      if seq1.count >= seq2.count
        seq1
      else
        seq2
      end
    end
  end

  def diff(matches)
    if matches.empty?
      original.map { |x| Display.deleted(x) } + revised.map { |x| Display.added(x) }
    elsif matches.first[0] == 0 && matches.first[1] == 0
      remaining_matches = matches.drop(1).map { |t| [t[0]-1, t[1]-1] }
      [original[0]] + Versions.new(original.drop(1), revised.drop(1)).diff(remaining_matches)
    elsif matches.first[0] == 0
      remaining_matches = matches.map { |t| [t[0], t[1]-1] }
      [Display.added(revised[0])] + Versions.new(original, revised.drop(1)).diff(remaining_matches)
    else matches.first[1] == 0
      remaining_matches = matches.map { |t| [t[0]-1, t[1]]}
      [Display.deleted(original[0])] + Versions.new(original.drop(1), revised).diff(remaining_matches)
    end
  end

end

module Display
  def self.deleted(text)
    '<span class="deleted-text"><strike>' + text + '</strike></span>'
  end

  def self.added(text)
    '<span class="added-text">' + text + '</span>'
  end
end
