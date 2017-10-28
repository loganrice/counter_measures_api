class AuthorizeApiRequestService

  def initialize(headers ={})
    @headers = headers
    @success = true
  end

  def call
    user if user
  end

  def success?
    @success
  end

  private

  attr_accessor :headers

  def user
    if raw_token
      @user ||= User.find(token[:user_id]) 
    else
      @success = false
    end
  end

  def token
    @token ||= JsonWebToken.decode(raw_token)
  end

  def raw_token 
    if headers['Authorization'].present? 
      return headers['Authorization'].split(' ').last 
    end
  end
end
