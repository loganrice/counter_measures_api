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
    logger.debug "*****params what works??? #{params}"
    logger.debug "*****params BODY?? #{request.body}"
    logger.debug "*****params RAW??? #{request.raw_post}"
    params.require(:user).permit(:email, :password)
  end
end
