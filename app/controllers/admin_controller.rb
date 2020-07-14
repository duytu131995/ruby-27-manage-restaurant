class AdminController < ActionController::Base
  before_action :set_locale
  before_action :admin_user

  include SessionHelper;

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def admin_user
    redirect_to admin_login_path unless current_user&.admin?
  end
end
