class PagesController < ApplicationController
  def home
  end

  def profile
    if current_user
      @bookings = current_user.bookings
      @treehouses = current_user.treehouses
    end
  end
end
