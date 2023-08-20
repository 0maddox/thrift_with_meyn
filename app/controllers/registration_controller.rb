class RegistrationController < ApplicationController

  # post /signup
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { success: 'User registered successfully', user: @user }, status: :created
    else
      render json: { error: @user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_picture)
  end
end
