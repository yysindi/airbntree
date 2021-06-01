class Booking < ApplicationRecord
  belongs_to :treehouse
  belongs_to :user
end
