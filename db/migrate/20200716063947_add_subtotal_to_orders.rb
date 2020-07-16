class AddSubtotalToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :subtotal, :decimal, precision: 65
  end
end
