class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index

    featured_events = Booking.group(:event_id).count(:event_id).sort_by{ |key , value| value}.reverse.to_h.keys
    @events = Event.all
    @most_popular_events = featured_events.map { |i| @events.find(i) }
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
  end

  def show
    @event = Event.find(params[:id])
    @booking = Booking.new
    to_show = current_user.bookings.map { |booking| booking.event_id == @event.id ? true : false  }
    @show_join = !to_show.include?(true)
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :description, :start_time, :photo, :category_id)
  end
end
