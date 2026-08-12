class AddTotal < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :order_total, :float
  end
end
