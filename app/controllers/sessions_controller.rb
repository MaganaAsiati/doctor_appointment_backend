class SessionsController < ApplicationController
  before_action :logged_in, only: %i[show]
  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = issue_token(@user)
      render json: { user: UserSerializer.new(@user), jwt: token }
    else
      render json: { error: 'Invalid username or password' }, status: 401
    end
  end

  def show
    render json: current_user, status: :ok
  end
end
