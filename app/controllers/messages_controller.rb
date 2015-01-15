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
  end

  def send_reply
    @reply_message = Message.find(params[:id]).children.create message_params
    redirect_to root_path if @reply_message.persisted?
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
