class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :treehouses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def offers
    Booking.where(treehouse_id: self.treehouses.ids).count
  end
end
