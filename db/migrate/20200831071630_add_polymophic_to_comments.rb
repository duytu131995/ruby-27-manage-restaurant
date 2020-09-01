class AddPolymophicToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
  end
end
