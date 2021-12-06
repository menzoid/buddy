class ChatroomUsersController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @user = User.find(params[:user])
    @chatroom_user = ChatroomUser.new(chatroom: @chatroom, user: @user)
    if @chatroom_user.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatroom/show"
    end
  end
end
