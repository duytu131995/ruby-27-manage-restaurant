class AddRatingToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :rating, :string
  end
end
