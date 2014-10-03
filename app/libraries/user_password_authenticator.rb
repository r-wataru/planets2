class UserPasswordAuthenticator
  class << self
    def verify(login_name, password)
      return false unless login_name.present? && password.present?
      user = User.find_by_login_name(login_name)
      user && user.authenticate(password)
    end
  end
end
