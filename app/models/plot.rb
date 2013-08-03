class Plot < ActiveRecord::Base
  attr_accessible :pick, :project_id

  validates :project_id, presence: true

  belongs_to :project

  has_many :arrangements

end
