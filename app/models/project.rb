class Project < ApplicationRecord
  belongs_to :user
  has_many :servers

  validates :user_id, presence: true
  validates :name, presence: true
end
