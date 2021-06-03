class Treehouse < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :price, numericality: { only_integer: true }, presence: true
  validates :description, length: { minimum: 30 }, presence: true
  validates :location, presence: true
end
