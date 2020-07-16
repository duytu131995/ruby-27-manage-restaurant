class AddDinnerTableRefToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :dinner_table, null: false, foreign_key: true
  end
end
