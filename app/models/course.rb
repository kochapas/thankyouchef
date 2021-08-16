class Course < ApplicationRecord
  belongs_to :chef_profile
  has_many :bookings, dependent: :destroy
end
