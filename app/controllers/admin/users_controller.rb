class Admin::UsersController < AdminController
  def index
    @departments = Department.all
    @users = User.includes(:department).page(params[:page]).per Settings.users.per
  end

  def show; end
end
