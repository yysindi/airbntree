class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :treehouses
<<<<<<< HEAD

=======
>>>>>>> 57bb14fe2d03bfe0adf72bcb5d4d09dca030f5a7
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
