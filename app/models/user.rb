class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :relationship_skills
  has_many :skills, through: :relationship_skills
  belongs_to :prosition
  belongs_to :team
  belongs_to :project

  validates :name, presence: true, length: {minimum: Settings.min}
  validates :birthday, presence: true
  validates :role, presence: true, numericality: {only_integer: true}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
