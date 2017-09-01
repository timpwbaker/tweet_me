class MessagesController < ApplicationController
  def index
    current_message = Message.new
    render locals: { messages: messages, current_message: current_message }
  end

  def create
    message = Message.new(message_params)

    if message.save
      flash[:success] = "Successfully sent message, why not send another?"
      redirect_to root_path
    else
      render :index, locals: { messages: messages, current_message: message }
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def messages
    if current_user
      current_user.messages
    else
      Message.all
    end
  end
end
