class DinnerTablesController < ApplicationController
  def index
    @dinner_tables = DinnerTable.all
  end

  def show
    if params[:search]
      @dishes = Dish.in_stock.searchDish("%#{params[:search]}%").page(params[:page]).per 4
      @count = Dish.in_stock.searchDish("%#{params[:search]}%").count
    else
      @dishes = Dish.in_stock.page(params[:page]).per 4
      @count = Dish.in_stock.count
    end
    @order_item = current_order.order_items.new
    session[:params_id] = params[:id]
  end

  def destroy
    @status_table = DinnerTable.find session[:params_id]
    @status_table.update(status: :free) if @status_table.using?
    if session.delete "order_id_#{session[:params_id]}"
      flash[:success] = t(".success") + ": " + @status_table.table_number.to_s
    else
      flash[:danger] = t ".danger"
    end
    redirect_to dinner_tables_path
  end
end
