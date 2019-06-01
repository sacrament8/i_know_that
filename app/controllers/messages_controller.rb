class MessagesController < ApplicationController
  before_action do
    @room = Room.find(params[:room_id])
  end

  def index
    @messages = @room.messages.preload(:user)

    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end

    @messages = @messages.order(:created_at)
    @message = @room.messages.build
  end

  def create
    @message = @room.messages.build(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = Room.find(params[:room_id]).messages
      render "messages/index"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @room = Room.find(params[:room_id])
    @message.destroy
    redirect_to room_messages_path(@room), notice: "メッセージを削除しました"
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end