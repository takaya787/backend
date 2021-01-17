module Api
  class AuthController < ApplicationController
    before_action :authorized, only: [:auto_login]
    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        payload = {user_id: @user.id}
        token = encode_token(payload)

        render json: {user: @user, token: token}
      else
        render json: {error: 'Invalid username or password'}, status: :unauthorized
      end
    end

    def auto_login
      render json: {user: {email: @current_user.email, id: @current_user.id}}
    end
  end
end
