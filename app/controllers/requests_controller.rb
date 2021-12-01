class RequestsController < ApplicationController

  def new
    @booking = Booking.find(params[:id])
    @request = Request.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @request = Request.new(request_params) # should be optional
    @request.booking = @booking
    @request.user = current_user
    if @request.save
      redirect_to event_bookings_path
    else
      render :new
    end
  end

  #   def request_params
  #   params.require(:request).permit(:request_description)
  # end
end
