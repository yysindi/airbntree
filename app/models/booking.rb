class Booking < ApplicationRecord
  belongs_to :treehouse, :user
end
