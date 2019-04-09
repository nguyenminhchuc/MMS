class Project < ApplicationRecord
  has_many :users
  has_many :teams

  validates :name, presence: true
  validates :short_name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :newest, -> {order created_at: :desc}
end
