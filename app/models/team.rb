class Team < ApplicationRecord
  belongs_to :project
  has_many :users

  validates :name, presence: true
  validates :description, presence: true
  validates :name_leader_team, presence: true
end
