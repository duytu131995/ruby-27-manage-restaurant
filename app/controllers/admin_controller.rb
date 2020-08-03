class AdminController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_admin_user!

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
