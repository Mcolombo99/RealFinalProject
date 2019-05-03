class ChatroomsController < ApplicationController
   private def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    chatroom_path(@chatroom)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to "/chatrooms/#{@chatroom.id}"
    else
      render :new
    end
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.update(chatroom_params)
      redirect_to "/chatrooms/#{@chatroom.id}"
    else
      render :edit
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to '/chatrooms'
  end
end