class ChefProfile < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy
  has_many :bookings, through: :courses

  validates :user, presence: true
end
