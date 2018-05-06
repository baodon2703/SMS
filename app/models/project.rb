class Project < ApplicationRecord
  belongs_to :user
  has_many :servers, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
end
