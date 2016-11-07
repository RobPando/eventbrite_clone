module SupportHelpers

  def logged_in(user)
    post login_path, params: { session: { email: user.email, password: user.password } }
  end

end