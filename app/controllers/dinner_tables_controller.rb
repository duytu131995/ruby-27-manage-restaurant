class DinnerTablesController < ApplicationController
  before_action :find_dinner_table, :update_atributes, only: :destroy
  before_action :find_table_manage, only: :update

  def index
    @dinner_tables = DinnerTable.page(params[:page]).per Settings.table.numb
  end

  def show
    @q = Dish.in_stock_status.ransack(params[:q])
    @dishes = @q.result.page(params[:page]).per Settings.table.dish
    @order_item = current_order.order_items.new
    session[:params_id] = params[:id]
  end

  def update
    if @table_manage.update table_manage_params
      ActionCable.server.broadcast "status_dinner_table_channel",
        id: @table_manage.id,
        status: @table_manage.status,
        name: @table_manage.table_number
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to admin_table_manage_index_path
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
    return if @status_table.free?

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

  def find_table_manage
    @table_manage = DinnerTable.find_by id: params[:id]
    return if @table_manage

    flash[:danger] = t "dinner_tables.find_dinner_table.danger"
    redirect_to admin_table_manage_path
  end

  def table_manage_params
    params.require(:dinner_table).permit DinnerTable::DINNER_TABLE_PARAMS
  end
end
