class Test
  def iniAuthenticateUserServicetialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private
  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      { errors: "Invalid credentials" }
    end
  end
end
