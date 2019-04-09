class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :relationship_skills
  has_many :skills, through: :relationship_skills
  belongs_to :prosition, optional: true
  belongs_to :team, optional: true
  belongs_to :project, optional: true

  validates :name, presence: true, length: {minimum: Settings.min}
  validates :birthday, presence: true
  validates :role, presence: true, numericality: {only_integer: true}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :newest, -> {order created_at: :desc}

  accepts_nested_attributes_for :skills
end
