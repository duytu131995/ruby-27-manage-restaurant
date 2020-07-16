class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @total = current_order.subtotal
  end
end
