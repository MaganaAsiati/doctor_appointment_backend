class Api::V1::DoctorsController < ApplicationController
  before_action :logged_in, only: %i[index show]
  before_action :found_doctor, except: %i[create index]
  before_action :user_ability, except: %i[index show]

  def index
    doctors = Doctor.all
    render json: doctors, status: :ok
  end

  def show
    render json: @doctor, status: :ok
  end

  def create
    @doctor = current_user.doctors.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :ok
    else
      render json: { errors: @doctor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      render json: 'Doctor update successfully', status: :ok
    else
      render json: { errors: @doctor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    render json: "#{@doctor.name} deleted successfully" if @doctor.destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :speciality, :image, :reserved, :description, :bill, :email, :location)
  end

  def found_doctor
    @doctor = Doctor.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Doctor not found' }, status: :not_found
  end

  def user_ability
    authorize! :manage, @doctor
  rescue CanCan::AccessDenied
    render json: { errors: 'You are not authorized to perform this action' },
              status: :unauthorized
  end
end
