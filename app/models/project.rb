class Project < ActiveRecord::Base
  attr_accessible :title

  validates :user_id, presence: true

  belongs_to :user, dependent: :destroy
  has_many :stacks

  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true

  default_scope order: 'projects.created_at DESC'
end
