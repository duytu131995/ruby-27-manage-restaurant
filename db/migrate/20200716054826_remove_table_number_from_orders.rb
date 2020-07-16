class RemoveTableNumberFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :table_number, :string
  end
end
