class EventsController < ApplicationController

  def index
    @featured_events = Event.all.sample(5)
    @events = Event.all
    @categories = Category.all
    @pg_search_events = Event.search_by_name(params[:query])
  end

  def show
    @event = Event.find(params[:id])
  end
end
