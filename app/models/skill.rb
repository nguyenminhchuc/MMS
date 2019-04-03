class Skill < ApplicationRecord
  has_many :relationship_skills
  has_many :users, through: :relationship_skills

  validates :name, presence: true
  validates :level, presence: true
  validates :used_year_member, presence: true, numericality: {only_integer: true}
end
