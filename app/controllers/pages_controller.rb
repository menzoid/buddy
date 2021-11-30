class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def dashboard
    @bookings = current_user.bookings
    @events = current_user.events
    # @nudges_received = something
    # @nudges_sent = something
    # @chatrooms = current_user.chatrooms
  end
end
