class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @treehouse = Treehouse.find(params[:treehouse_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to treehouses_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require[:booking].permit(:check_in, :check_out, :total_price)
  end
end
