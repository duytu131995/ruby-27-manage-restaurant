class Admin::SessionController < SessionController
  include SessionHelper

  def index; end

  def new; end

  def create
    user = User.find_by email: params[:session][:email]
    if user&.authenticate params[:session][:password]
      log_in user
      redirect_to admin_root_path
    else
    render :new
    end
  end

  def destroy
    log_out
    redirect_to admin_login_url
  end
end
