class ApplicationController < ActionController::API
  def jwt_key
    Rails.application.secrets.secret_key_base
  end

  # hide user data
  def issue_token(user)
    JWT.encode({ user_id: user.id }, jwt_key, 'HS256')
  end

  # GET DATA FROM THE TOKEN
  def decode_token
    JWT.decode(token, jwt_key, true, { algorithm: 'HS256' })
  rescue StandardError
    [{ error: 'invalid token' }]
  end

  # put the token in the authorazation header
  def token
    request.headers['Authorization']
  end

  # get userid from the token
  def user_id
    decode_token.first['user_id']
  end

  # get user from the token
  def current_user
    user ||= User.find_by(id: user_id)
    user
  end

  # check if user is logged in
  def logged_in
    unless !!current_user
      render json: { error: 'You are not logged in' }
    end
  end
end
