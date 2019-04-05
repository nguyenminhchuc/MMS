class Team < ApplicationRecord
  belongs_to :project, optional: true
  has_many :users

  validates :name, presence: true
  validates :description, presence: true
  validates :name_leader_team, presence: true

  scope :newest, -> { order created_at: :desc }
end
