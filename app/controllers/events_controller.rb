class EventsController < ApplicationController

  def index
    @featured_events = Event.all.sample(5)
    @events = Event.all
    @categories = Category.all

    if params[:query].present?
      @pg_search_events = Event.search_by_name(params[:query])
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { events: @pg_search_events} }
    end
  end


  def show
    @event = Event.find(params[:id])
  end
end
