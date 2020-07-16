class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_order

  include SessionHelper

  def current_order
    if session["order_id_#{session[:params_id]}"].nil?
      Order.new
    else
      Order.find session["order_id_#{session[:params_id]}"]
    end
  end

  private

  def logged_in_user
    return if logged_in

    flash[:info] = t("login_errors.info")
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
