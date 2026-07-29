class RemovePassword < ActiveRecord::Migration[8.1]
  def change
    remove_column :customers, :password, :string
  end
end
