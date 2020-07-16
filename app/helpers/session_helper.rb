module SessionHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    if user_id = session[:user_id]
      User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user&.authenticated? cookies[:remember_token]
        log_in user
        user
      end
    end
  end

  def logged_in
    current_user.present?
  end

  def log_out
    session.delete :user_id
    cookies.delete :user_id
  end

  def status_dinner_tabel val
    val.free? ? t("dinner_tables.free") : t("dinner_tables.using")
  end
end
