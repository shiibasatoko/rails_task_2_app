class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ edit update destroy ]

  # GET /reservations or /reservations.json
  def index
     @reservations = current_user.reservations.all.order created_at: :desc
  end
  
  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1 or /reservations/1.json
  def show
   @reservation = Reservation.find(params[:id])
  end
  
  def finished
    @reservation = Reservation.find(params[:id])
  end
    

  # GET /reservations/1/edit
  def edit
    redirect_to '/rooms'
    
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @user_id = current_user.id
    @reservation.days = ("#{@reservation.end_on.to_date - @reservation.start_on.to_date}")
    @reservation.sum_fee = ("#{@reservation.days * @reservation.room.fee * @reservation.people}")
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_path(@reservation.id) }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
     redirect_to '/rooms'
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
     redirect_to '/rooms'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :start_on, :end_on, :people, :sum_fee, :days)
    end
end
