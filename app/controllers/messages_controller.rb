class MessagesController < ApplicationController
    # Add RESTful actions here
  def index
    @chatrooms = Chatroom.all
  end

  private def message_params
    params.require(:message).permit(:body, :chatroom_id)
  end

  def show
    @message = Message.find(params[:id])
    if @message.chatroom_id
      @chatroom = @message.chatroom
      chatroom_path(@chatroom)
    else
      @body = @message.body
    end
  end

  def new
    @message = Message.new
    @chatroom = @message.chatroom || nil
    @message.save
    @chatroom ? (redirect_to "/chatrooms") : nil
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to "/chatrooms"
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to "/chatrooms/#{@message.chatroom_id}"
    else
      render '/'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.delete
    redirect_to '/chatrooms'
  end
end
