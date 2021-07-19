class MessagesController < ApplicationController
  before_action :authenticate_user!
 
  def create
    @item = Item.find(params[:item_id])
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    else
      @message = message.includes(:user)
      render :index
    end
  end
  def message_params
    params.require(:message).permit(:text).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end


