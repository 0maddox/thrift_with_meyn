class AuthorizationController < ApplicationController
  # before_action :authenticate_user!, only: [:show_current_user]

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = TokenService.generate_token(payload)
      render json: { token: token, user: user }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end


# GET /me
def me
  header = request.headers['Authorization']
  token = header.split.last if header

  decoded_token = TokenService.verify_token(token)

  if decoded_token
    user_id = decoded_token['user_id']
    @current_user = User.find(user_id)
    render json: { user: @current_user }
  else
    render json: { error: 'Invalid or expired token' }, status: :unauthorized
  end
rescue ActiveRecord::RecordNotFound
  render json: { error: 'User not found' }, status: :unauthorized
end

  def forgot_password
    user = User.find_by(email: params[:email])

    if user.present?
      user.send_reset_password_instructions
      render json: { message: 'Password reset instructions sent to your email' }
    else
      render json: { error: 'Email address not found' }, status: :unprocessable_entity
    end
  end

  def logout
    header = request.headers['Authorization']
    token = header.split.last if header

    decoded_token = TokenService.verify_token(token)

    if decoded_token
      jti = decoded_token['jti']
      exp = (Time.now + 24.hours).to_i # Convert the expiration time to a numeric value

      new_token = JWT.encode({ jti: jti, exp: exp }, Rails.application.secrets.secret_key_base, 'HS256')
      JwtDenylist.create(jti: jti, token: token, exp: Time.at(exp)) # Store the expiration time as a Time object in the database
      render json: { token: new_token, message: 'Logout success' }
    else
      render json: { error: 'Invalid or expired token' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :unauthorized
  end

  def denylist_jwt
    JwtDenylist.create(token: current_jwt_token)
    render json: { message: 'JWT has been denied' }
  end
end
