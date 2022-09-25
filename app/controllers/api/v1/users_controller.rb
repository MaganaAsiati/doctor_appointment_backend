class Api::V1::UsersController < ApplicationController
  before_action :logged_in, only: %i[update]
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      token = issue_token(@user)
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if current_user.admin?
      render json: @user if @user.update(params.permit(:role))
    elsif @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { error: 'You are not authorized to perform this action' }, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    render json: "#{@user.name} deleted successfully" if @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:name, :email, :password)
  end
end
