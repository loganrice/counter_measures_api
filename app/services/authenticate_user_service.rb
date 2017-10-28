class AuthenticateUserService
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  def success?
    @success
  end

  private
  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      @success = false
    end
  end
end
