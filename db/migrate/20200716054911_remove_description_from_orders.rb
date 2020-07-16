class RemoveDescriptionFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :description, :text
  end
end
