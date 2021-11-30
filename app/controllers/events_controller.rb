class EventsController < ApplicationController

  def index
    @featured_event = Event.all.sample(5)
    @events = Event.all
    @categories = Category.all
  end

  def show
    @event = Event.find(params[:id])
    @event_category = @event.category
    @category_events = @event_category.events
    raise
  end
end
