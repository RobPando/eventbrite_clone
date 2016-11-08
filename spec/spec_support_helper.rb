module SupportHelpers

  def log_in_user
    user = create(:user)
    session[:user_id] = user.id
  end

  def log_in(user)
    post login_path, params: { session: {email: user.email, password: user.password } }
  end
end
