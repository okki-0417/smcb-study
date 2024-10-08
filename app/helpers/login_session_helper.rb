# froze_string_literal: true

module LoginSessionHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def login(user)
    reset_session
    session[:user_id] = user.id
  end

  def logout
    reset_session
    @current_user = nil
  end

  def restrict_to_login_user
    redirect_to new_user_path unless logged_in?
  end

  def logged_in?
    current_user.present?
  end
end
