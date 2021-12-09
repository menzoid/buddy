class EventsController < ApplicationController

  def index
    @featured_events = Event.all.sample(5)
    @events = Event.all
    @categories = Category.all
    @outdoor = @categories.select { |category| category.name == "Outdoors" }
    @dining = @categories.select { |category| category.name == "Dining" }
    @outdoors = @events.select { |event| event.category.name == "Outdoors" }
    @dinings = @events.select { |event| event.category.name == "Dining" }
    @user = current_user
    @date = Time.now.strftime("%d %b %Y")
    @bookings = Booking.all

    if params[:query].present?
      @pg_search_events = Event.search_by_name(params[:query])
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { events: @pg_search_events } }
    end
    raise
  end

  def show
    @event = Event.find(params[:id])
    @markers = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
    @booking = Booking.new
    to_show = current_user.bookings.map { |booking| booking.event_id == @event.id ? true : false  }
    @show_join = to_show.include?(true)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :index
    end
  end

  def request_params
    params.require(:event).permit(:name, :address, :description, :start_time)
  end
end
