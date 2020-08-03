class DinnerTablesController < ApplicationController
  before_action :find_dinner_table, :update_atributes, only: :destroy

  def index
    @dinner_tables = DinnerTable.page(params[:page]).per Settings.table.numb
  end

  def show
    @dishes = Dish.in_stock_status.by_attributes("%#{params[:search]}%").page(params[:page]).per Settings.table.dish
    @order_item = current_order.order_items.new
    session[:params_id] = params[:id]
  end

  def destroy
    if session.delete "order_id_#{session[:params_id]}"
      flash[:success] = t(".success") + ": " + @status_table.table_number.to_s
    else
      flash[:danger] = t ".danger"
    end
    redirect_to dinner_tables_path
  end

  private

  def update_atributes
    return unless @status_table.using?

    if @status_table.free!
      flash[:info] = t ".update_atributes.info"
    else
      flash[:danger] = t ".update_atributes.danger"
      redirect_to root_path
    end
  end

  def find_dinner_table
    @status_table = DinnerTable.find_by id: session[:params_id]
    return if @status_table

    flash[:danger] = t "dinner_tables.find_dinner_table.danger"
    redirect_to root_path
  end
end
