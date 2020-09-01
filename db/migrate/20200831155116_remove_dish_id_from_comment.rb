class RemoveDishIdFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :dish, index: true, foreign_key: true
  end
end
