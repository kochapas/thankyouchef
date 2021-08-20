class Booking < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_one :chef_profile, through: :course

  validates :course, presence: true
  # validates :date_and_start_time, presence: true
  # validates :status, presence: true
  validates :user, presence: true, exclusion: { in: ->(booking) { [booking.chef_profile.user] } }
  enum time_slot: ['breakfast', 'lunch', 'dinner']
  enum status: ['awaiting confirmation', 'confirmed', 'declined', 'completed']
end
