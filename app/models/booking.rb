class Booking < ApplicationRecord
  belongs_to :treehouse
  belongs_to :user

  after_commit :create_notifications, on: :create

  private

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'post'
      notification.actor = self.user
      notification.user = self.treehouse.user
      notification.target = self
      notification.second_target = self.treehouse
    end
  end
end
