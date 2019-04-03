class Position < ApplicationRecord
  has_many :users

  validates :name, presence: true, length: {minimum: Settings.min}
  validates :short_name, presence: true, length: {minimum: Settings.min}
end
