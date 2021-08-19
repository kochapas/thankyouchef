class Course < ApplicationRecord
  CUISINES = %w[chinese italian japanese french belgian american indian ethiopian cuban indonesian filipino]
  belongs_to :chef_profile
  # belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_one :user, through: :chef_profile

  validates :chef_profile, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :cuisine_type, presence: true
  validates :duration, presence: true
  validates :price, presence: true

  include PgSearch::Model
    pg_search_scope :search_by_name_and_description,
    # duration
      against: [ :name, :description , :price],
      associated_against: {
        chef_profile: [ :years_exp ],
        user: [:first_name, :city]
      },
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
      # associated_against: {
      #   users: [:first_name]
      # }

  # include PgSearch::Model
  # multisearchable against: [ :name, :description , :price]

  def self.search(keywords)
    if keywords
      where("name ILIKE ?", "%#{keywords}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
