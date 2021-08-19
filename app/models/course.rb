class Course < ApplicationRecord
  belongs_to :chef_profile
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :chef_profile, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :cuisine_type, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  def self.search(keywords)
    if keywords
      where("name ILIKE ?", "%#{keywords}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
