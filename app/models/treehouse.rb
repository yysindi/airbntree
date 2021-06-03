class Treehouse < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :price, numericality: { only_integer: true }, presence: true
  validates :description, length: { minimum: 30 }, presence: true
  validates :location, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_location_and_description,
    against: [:location, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
