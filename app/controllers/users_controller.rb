class UsersController < ApplicationController
  before_action :find_user, only: :show

  include ApplicationHelper

  def index
    @book_tables = BookTable.page(params[:page]).per Settings.dishes.per_page
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = t "users.active.active_check"
      redirect_to root_url
    else
      flash[:danger] = t "users.create.create_fail"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit User::PERMIT_ATTRIBUTES
  end

  def find_user
    @user = User.find_by id: params[:id]
    return @user if @user

    flash[:danger] = t ".danger"
    redirect_to root_url
  end
end
