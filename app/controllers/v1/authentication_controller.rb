class V1::AuthenticationController < ApplicationController 
  def create
    token = AuthenticateUserService.new(email: form_params[:email], password: form_params[:password]).call
    if token.success?
      render json: { auth_token: token.data }
    else
      render json: { errors: token.error }
    end
  end

  private

  def form_params
    params.require(:user).permit(:email, :password)
  end
end
