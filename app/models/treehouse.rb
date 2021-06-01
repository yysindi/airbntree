class Treehouse < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :price, numericality: { only_integer: true }, presence: true
  validates :description, length: { minimum: 30 }, presence: true
  validates :location, presence: true
end
