class  MessagesController < ApplicationController
  respond_to :html, :js, only: [:create]
  before_action :load_messages
  before_action :new_message

  def create
    @message = Message.new(message_params)
    @message.save
  end

  def reply
    @parent = Message.find(params[:id])
    @message = Message.new(message_params)
  end

  def send_reply
    
  end

  private

  def load_messages
    @messages ||= Message.all
  end

  def new_message
    @message ||= Message.new
  end

  def message_params
    params.require(:message).permit(:name, :text)
  end

end
