class Booking < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_one :chef_profile, through: :course

  validates :course, presence: true
  validates :user, presence: true, exclusion: { in: ->(booking) { [booking.chef_profile.user] } }
end
