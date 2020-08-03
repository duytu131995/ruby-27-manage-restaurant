class OrderItemsController < ApplicationController
  before_action :get_current_order
  before_action :find_order_items, only: [:update, :destroy]
  before_action :reload_number, only: :create

  def index
    @order_items = @order.order_items if @order
  end

  def create
    create_order_and_order_items if current_admin_user
  end

  def update
    @order_item.update order_item_params
    reload_total_order_items
  end

  def destroy
    @order_item.destroy
    reload_total_order_items
  end

  private

  def get_current_order
    @order = current_order
  end

  def find_order_items
    @order_item = @order.order_items.find params[:id]
  end

  def reload_total_order_items
    @order_items = @order.order_items
    @total = @order.subtotal
  end

  def create_order_and_order_items
    @order.dinner_table_id = session[:params_id] unless @order.dinner_table_id?
    @order.user_id = current_admin_user.id unless @order.user_id?
    @order.save
    status_table = DinnerTable.find_by id: @order.dinner_table_id
    status_table.update(status: :using) if status_table.free?
    session["order_id_#{session[:params_id]}"] = @order.id
  end

  def reload_number
    @order_item = @order.order_items.new order_item_params
    return unless @reload = @order.order_items.find_by(dish_id: params[:order_item][:dish_id])

    @order_item.quantity = @reload.quantity.to_i + params[:order_item][:quantity].to_i
    @reload.destroy
  end

  def order_item_params
    params.require(:order_item).permit OrderItem::ORDER_ITEMS_PARAMS
  end
end
