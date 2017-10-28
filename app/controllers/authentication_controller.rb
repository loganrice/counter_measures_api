class AuthenticationController < ApplicationController
  # skip_before_action :authenticate_request

  def authenticate
    token = AuthenticateUser.call(params[:email], params[:password])
    if token.success?
      render json: { auth_token: token }
    else
      render json: { errors: "Invalid credentials" }
    end
  end
end
