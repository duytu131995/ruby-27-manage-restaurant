class UsersController < ApplicationController
  before_action :find_user, only: :show

  include ApplicationHelper

  def index
    @book_tables = BookTable.by_attributes(current_admin_user.id).page(params[:page]).per Settings.dishes.per_page
  end

  def show; end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return @user if @user

    flash[:danger] = t ".danger"
    redirect_to root_url
  end
end
