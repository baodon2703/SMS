class Monitoring < ApplicationRecord
  belongs_to :server

  validates :server_id, presence: true
  validates :name, presence: true
end
