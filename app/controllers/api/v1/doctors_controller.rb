class Api::V1::DoctorsController < ApplicationController
    before_action :get_doctor, except: %i[create index]

    def index
        doctors = Doctor.all
        render json: doctors, status: :ok
    end

    def show
        render json: @doctor, status: :ok
    end

    def create
        doctor = Doctor.new(doctor_params)
        if doctor.save
            render json: doctor, status: :ok
        else
            render json: { errors: doctor.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    def update
        unless @doctor.update(user_params)
            render json: { errors: @doctor.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    def destroy
        @doctor.destroy
    end

    private

    def doctor_params
        params.permit(:name, :speciality, :image, :reserved, :description, :bill, :email, :location)
    end

    def get_doctor
        @doctor = Doctor.find(id: params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Doctor not found' }, status: :not_found
    end
end
