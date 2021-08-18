class ChefProfile < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy
  has_many :bookings, through: :courses
  has_one_attached :photo

  validates :user, presence: true
end
