class BookingsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.event = @event
    @booking.user = current_user
    if @booking.save
      redirect_to event_bookings_path
    else
      render :new
    end
  end

  def index
    @event = Event.find(params[:event_id])
    @bookings = @event.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:intention_description, :intention_id, :event_id, :user_id)
  end
end
