class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    if Room.between(params[:sender_id], params[:recipient_id]).present?
      @room = Room.between(params[:sender_id], params[:recipient_id]).first
    else
      @room = Room.create!(room_params)
    end
    redirect_to room_messages_path(@room)
  end

  private

  def room_params
    params.permit(:sender_id, :recipient_id)
  end
end