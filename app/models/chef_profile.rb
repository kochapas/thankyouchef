class ChefProfile < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy

  validates :user, presence: true
end
