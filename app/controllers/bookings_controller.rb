class BookingsController < ApplicationController
  def new
    @treehouse = Treehouse.find(params[:treehouse_id])
    @booking = Booking.new
  end

  def create
    @treehouse = Treehouse.find(params[:treehouse_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.treehouse = @treehouse
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :total_price)
  end
end
