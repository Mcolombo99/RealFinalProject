class ChatroomsController < ApplicationController
  before_action :authenticate_user!
   before_action :set_chatroom, only: [:show, :edit, :destroy, :update, :add_user, :delete_user]
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @users = User.all
    chatroom_path(@chatroom)
  end
  def add_user
      @u = User.find(params[:user_id])
      puts @u
      @chatroom.users |= [@u]
  end

  def delete_user
    @u = User.find(params[:user_id])
    @chatroom.users.delete(@u)
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
  end

  def update
    if @chatroom.update(chatroom_params)
      redirect_to "/chatrooms/#{@chatroom.id}"
    else
      render :edit
    end
  end

  def destroy
    @chatroom.destroy
    redirect_to '/chatrooms'
  end

   private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
end
end