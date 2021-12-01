class RequestsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @request = Request.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @request = Request.new(request_params)
    @request.requester_id = current_user.id
    @request.requestee_id = @booking.user.id
    if @request.save
      redirect_to event_bookings_path(@booking.event)
    else
      render :new
    end
  end

  def request_params
    params.require(:request).permit(:reason, :resquester_id, :requestee_id)
  end
end
