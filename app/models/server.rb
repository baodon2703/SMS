class Server < ApplicationRecord
  belongs_to :project

  validates :project_id, presence: true
  validates :name, presence: true
end
