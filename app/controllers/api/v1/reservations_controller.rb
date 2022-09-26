class Api::V1::ReservationsController < ApplicationController
  before_action :logged_in, only: %i[index show]
  before_action :set_reservation, except: %i[create index]
  before_action :user_ability, except: %i[update destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all
    render json: @reservations, status: :ok
  end

  # GET /reservations/1
  def show
    render json: @reservation, status: :ok
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: :ok
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    render json: "#{@reservation.date_reserved} reservation deleted successfully" if @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Reservation not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:date_reserved, :city, :duration, :user_id, :doctor_id)
  end

  def user_ability
    authorize! :manage, @reservation
  rescue CanCan::AccessDenied
    render json: { errors: 'You are not authorized to perform this action' },
           status: :unauthorized
  end
end
