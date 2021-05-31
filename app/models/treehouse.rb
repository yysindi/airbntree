class Treehouse < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :users
end
