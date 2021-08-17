class Course < ApplicationRecord
  belongs_to :chef_profile
  has_many :bookings, dependent: :destroy

  validates :chef_profile, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :cuisine_type, presence: true
  validates :duration, presence: true
  validates :price, presence: true
end
