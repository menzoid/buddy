class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def welcome
    @user = current_user
  end

  def dashboard
    @user = current_user
    @bookings = current_user.bookings
    # @bookings_all = Booking.all
    @events = current_user.events
    @categories = Category.all
    # @notifications = @bookings.requests_as_requestee
    # @requests = @bookings.requests_as_requester
    @notifications = current_user.requests_as_requestee.pending
    @requests = current_user.requests_as_requester.pending
    @groupings = current_user.chatrooms
    # @requests = current_user.requests
    # @notifications = @requests.select { |request| request.requestee == current_user }
    # @nudges = @requests.select { |request| request.requester == current_user }
    # @nudges_received = something
    # @nudges_sent = something
    # @chatrooms = current_user.chatrooms
    start_date = params.fetch(:start_date, Date.today).to_date
    @events_month = current_user.events.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def mycalendar
    @user = current_user
    @bookings = current_user.bookings
    # @bookings_all = Booking.all
    @events = current_user.events
    @categories = Category.all
    # @notifications = @bookings.requests_as_requestee
    # @requests = @bookings.requests_as_requester
    @notifications = current_user.requests_as_requestee.pending
    @requests = current_user.requests_as_requester.pending
    @groupings = current_user.chatrooms
    # @requests = current_user.requests
    # @notifications = @requests.select { |request| request.requestee == current_user }
    # @nudges = @requests.select { |request| request.requester == current_user }
    # @nudges_received = something
    # @nudges_sent = something
    # @chatrooms = current_user.chatrooms
    start_date = params.fetch(:start_date, Date.today).to_date
    @events_month = current_user.events.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def mymap
    @user = current_user
    @bookings = current_user.bookings
    # @bookings_all = Booking.all
    @events = current_user.events
    @categories = Category.all
    # @notifications = @bookings.requests_as_requestee
    # @requests = @bookings.requests_as_requester
    @notifications = current_user.requests_as_requestee.pending
    @requests = current_user.requests_as_requester.pending
    @groupings = current_user.chatrooms
    # @requests = current_user.requests
    # @notifications = @requests.select { |request| request.requestee == current_user }
    # @nudges = @requests.select { |request| request.requester == current_user }
    # @nudges_received = something
    # @nudges_sent = something
    # @chatrooms = current_user.chatrooms
    start_date = params.fetch(:start_date, Date.today).to_date
    @events_month = current_user.events.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @markers = @events.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
