class RemoveRole1FromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :role, :integer
  end
end
