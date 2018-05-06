class Server < ApplicationRecord
  belongs_to :project
  has_many :monitorings, dependent: :destroy

  validates :project_id, presence: true
  validates :name, presence: true
end
