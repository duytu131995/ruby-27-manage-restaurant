class Admin::UsersController < AdminController
  before_action :find_user, only: %i(edit update destroy)
  before_action :load_departments, only: %i(show edit update)

  load_and_authorize_resource

  def index
    @users = User.includes(:department).where.not(role: :customer).page(params[:page]).per Settings.users.per
  end

  def show; end

  def edit; end

  def update
    if @user.update params_user
      flash[:success] = t ".success"
      redirect_to admin_user_path
    else
      flash[:danger] = t ".danger"
      redirect_to edit_admin_user_path @user
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to admin_users_path
  end

  private

  def current_ability
    @current_ability ||= Ability.new current_admin_user
  end

  def load_departments
    @departments = Department.pluck :name, :id
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".find_user.danger"
    redirect_to root_path
  end

  def params_user
    params.require(:user).permit User::USER_PARAMS
  end
end
