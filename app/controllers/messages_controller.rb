class MessagesController < ApplicationController
  def index
    new_message = Message.new
    render locals:
      { messages: messages, new_message: new_message, user: sender }
  end

  def create
    message = Message.new(message_params)

    if message.save
      flash[:success] = "Successfully sent message, why not send another?"
      redirect_to root_path
    else
      render :index,
             locals: { messages: messages, new_message: message, user: sender }
    end
  end

  def destroy
    if message.destroy
      flash[:success] = "Successfully deleted your message"
    else
      flash[:error] = "It is not possible to delete this message"
    end
    redirect_to root_path
  end

  private

  def sender
    current_user
  end

  def message
    Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id, :attached_image)
  end

  def messages
    Message.all.reverse
  end
end
