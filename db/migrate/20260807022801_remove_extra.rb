class RemoveExtra < ActiveRecord::Migration[8.1]
  def change
    remove_column :customers, :phone, :integer
    remove_column :orders, :order_date, :date
  end
end
