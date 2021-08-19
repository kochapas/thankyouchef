class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one :chef_profile
  has_many :bookings
  # Courses booked as a customer (i.e. to eat)
  has_many :courses_booked, through: :bookings, source: :course
  # Courses created as a chef (i.e. to serve)
  has_many :courses_created, through: :chef_profile, source: :courses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  multisearchable against: [:first_name]

  def chef?
    chef_profile.present?
  end



  validates :email, presence: true
  # validates :password, presence: true
end
