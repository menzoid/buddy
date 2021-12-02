class RemoveChatRoomUserIdFromMessage < ActiveRecord::Migration[6.1]
  def change
    remove_reference :messages, :chatroom_user, null: false, foreign_key: true
  end
end
