class PagesController < ApplicationController
  def home
  end

  def profile
    @treehouse = current_user.treehouses.ids
    @offers = Booking.where(treehouse_id: @treehouse)
  end

end
