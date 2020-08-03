class BookTablesController < ApplicationController
  before_action :authenticate_admin_user!

  def index; end

  def new; end

  def create
    @book_table = current_admin_user.book_tables.build book_table_params
    if @book_table.save
      flash[:success] = t "book_tables.create_success"
    else
      flash[:danger] = t "book_tables.create_error"
    end
    redirect_to root_path
  end

  private

  def book_table_params
    params.require(:book_table).permit BookTable::BOOK_TABLE_PARAMS
  end
end
