class EventsController < ApplicationController

  def index
    @featured_event = Event.all.sample(5)
    @events = Event.all
    @categories = Category.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
