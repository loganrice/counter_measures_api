class AuthenticateUserService
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    if user
      OpenStruct.new(success?: true, data: JsonWebToken.encode(user_id: user.id), error: nil)
    else
      OpenStruct.new(success?: false, data: nil, error: "Invalid user or password")
    end
  end

  private
  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
