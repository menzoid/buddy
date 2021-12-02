class RequestsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @request = Request.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @request = Request.new(request_params)
    @request.requester = current_user.bookings.find_by(event: @booking.event)
    @request.requestee = @booking
    if @request.save!
      redirect_to event_bookings_path(@booking.event)
    else
      render :new
    end
  end

  def accept
    @request = Request.find(params[:id])
    @request.accepted!

    @requestee_id = @request.requestee.user.id
    @requester_id = @request.requester.user.id

    @event = @request.requester.event

    @chatroom = Chatroom.create(name: "empty", event: @event)
    @chatroom.name = "Chatroom for #{@event.name} id##{@chatroom.id}"
    @chatroom.save
    @chatroom.users << User.find(@requestee_id)
    @chatroom.users << User.find(@requester_id)

    redirect_to chatroom_path(@chatroom)
  end

  def reject
    @request = Request.find(params[:id])
    @request.rejected!

    redirect_to dashboard_path
  end

  private

  def request_params
    params.require(:request).permit(:reason, :resquester_id, :requestee_id)
  end
end
