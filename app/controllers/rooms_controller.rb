class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy  ]

  def new
    @room = Room.new
  end

  def edit
    redirect_to '/rooms'
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @user_id = current_user.id
    
    respond_to do |format|
      if @room.save
        format.html { redirect_to room_path(@room) }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @rooms = Room.all.order created_at: :desc
    @reservation = Reservation.new
    @reservation.room_id = params[:id]
  end

  def update
    redirect_to '/rooms'
  end

  def destroy
    redirect_to '/rooms'
  end
  
  def search
    @range = params[:range]
    @rooms = Room.looks(params[:search],params[:word])
  end
  
  def index
    @rooms = current_user.rooms.all.order created_at: :desc
  end
  
  
  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:title, :body, :fee, :address, :image)
    end
end
