class Project < ActiveRecord::Base
  attr_accessible :title, :description_short, :description_long

  validates :user_id, presence: true

  belongs_to :user
  has_many :stacks
  has_many :plots, dependent: :destroy

  has_many :cards, through: :stacks,  dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true

  default_scope order: 'projects.created_at DESC'

  def num_stacks
    stacks.count
  end

end
