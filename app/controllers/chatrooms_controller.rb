class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @event = Event.find(@chatroom.event_id)
    chatty = current_user.chatrooms.filter { |chat| chat.event_id == @event.id }

    users_a = chatty.map do |chat|
      chat.users.reject { |u| @chatroom.user_ids.include?(u.id) }
    end
    @users_available = users_a.flatten.uniq
  end

  def index
    @chatrooms = current_user.chatrooms
    @chatrooms_sorted = @chatrooms(updated_at: :desc)
  end
end
